#!/bin/bash

set -ex

filter_charts() {
    while read chart; do
        [[ ! -d "$chart" ]] && continue
        if [[ -f "$chart/Chart.yaml" ]]; then
            echo $chart
        else
           echo "WARNING: $file is missing, assuming that '$chart' is not a Helm chart. Skipping." 1>&2
        fi
    done
}

lookup_changed_charts() {
    local commit=$(git rev-list --max-parents=0 --first-parent HEAD)

    local changed_files
    changed_files=$(git diff --find-renames --name-only "$commit" -- "charts")

    local fields
    if [[ "$charts_dir" == '.' ]]; then
        fields='1'
    else
        fields='1,2'
    fi

    cut -d '/' -f "$fields" <<< "$changed_files" | uniq | filter_charts
}

changed_charts=()
readarray -t changed_charts <<< "$(lookup_changed_charts "$latest_tag")"

if [[ -n "${changed_charts[*]}" ]]; then
    rm -rf .cr-release-packages
    mkdir -p .cr-release-packages

    rm -rf .cr-index
    mkdir -p .cr-index

    # Package
    for CHART_DIR in "${changed_charts[@]}"; do
        helm package "${CHART_DIR}" --destination .cr-release-packages --dependency-update
    done

    # Release
    cr upload --config chart-releaser.yaml --token $GITHUB_TOKEN -c "$(git rev-parse HEAD)"

    # Index
    cr index --config chart-releaser.yaml

    # Update Pages
    gh_pages_worktree=$(mktemp -d)

    git worktree add "$gh_pages_worktree" gh-pages

    cp --force .cr-index/index.yaml "$gh_pages_worktree/index.yaml"

    pushd "$gh_pages_worktree" > /dev/null

    git add index.yaml
    git commit --message="Update index.yaml" --signoff

    git push "https://x-access-token:$GITHUB_TOKEN@github.com/restorecommerce/helm" gh-pages

    popd > /dev/null

    git worktree remove "$gh_pages_worktree"


else
    echo "Nothing to do. No chart changes detected."
fi
