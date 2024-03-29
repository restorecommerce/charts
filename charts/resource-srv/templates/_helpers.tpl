{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "resource-srv.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "resource-srv.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "resource-srv.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "resource-srv.labels" -}}
helm.sh/chart: {{ include "resource-srv.chart" . }}
{{ include "resource-srv.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "resource-srv.selectorLabels" -}}
app.kubernetes.io/name: {{ include "resource-srv.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "resource-srv.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "resource-srv.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the NODE_ENV variable.
*/}}
{{- define "resource-srv.nodeEnv" -}}
{{- if .Values.config.name }}
{{- printf "%s:%s" .Values.env.nodeEnv (.Values.config.file | trimPrefix (printf "config_%s_" .Values.env.nodeEnv) | trimSuffix  ".json") }}
{{- else if .Values.config.literal }}
{{- printf "%s:override" .Values.env.nodeEnv }}
{{- else }}
{{- printf "%s" .Values.env.nodeEnv }}
{{- end }}
{{- end }}