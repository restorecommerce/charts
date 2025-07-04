# rendering-srv

![Version: 0.1.37](https://img.shields.io/badge/Version-0.1.37-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.4.1](https://img.shields.io/badge/AppVersion-1.4.1-informational?style=flat-square)

Restorecommerce rendering-srv

**Homepage:** <https://docs.restorecommerce.io/rendering-srv/index.html>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| restorecommerce | <info@restorecommerce.io> | <https://restorecommerce.io/> |

## Source Code

* <https://github.com/restorecommerce/rendering-srv>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Specify the affinity for all pods |
| args | list | `[]` | Override arguments for all pods |
| autoscaling.enabled | bool | `false` | Enable HPA |
| autoscaling.maxReplicas | int | `100` | Max amount of replicas for HPA |
| autoscaling.minReplicas | int | `1` | Min amount of replicas for HPA |
| autoscaling.targetCPUUtilizationPercentage | int | `80` | Target CPU usage for HPA |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` | Target memory usage for HPA |
| command | list | `[]` | Override command for all pods |
| config.file | string | `"config_production_override.json"` | Name of the file in the config map |
| config.literal | string | `""` | Provide the literal config through this string. Has to be in a JSON format |
| config.name | string | `""` | Name of the config map to be mounted. If specified, config will be appended to the node environment automatically |
| enableHealthCheck | bool | `true` | Enable health checks |
| env.extras | list | `[]` | Any extra environment variables appended to all pods |
| env.nodeEnv | string | `"production"` | The selected node environment and config |
| fullnameOverride | string | `""` | Full name override for all resources |
| global.authentication.apiKey | string | `""` | The global root API key |
| handlebars | object | `{"helper-list.js":"module.exports = function listHandlebarsExtensions(hbs, opts) {\n  hbs.registerHelper(\"list\", function(items, options) {\n    const itemsAsHtml = items.map(item => \"<li>\" + options.fn(item) + \"</li>\");\n    return \"<ul>\\n\" + itemsAsHtml.join(\"\\n\") + \"\\n</ul>\";\n  });\n};\n"}` | Handlebar helpers to be injected in the container More information: https://github.com/restorecommerce/handlebars-helperized |
| image.pullPolicy | string | `"IfNotPresent"` | Pull policy of the deployment |
| image.repository | string | `"ghcr.io/restorecommerce/rendering-srv"` | Image to be used for deployment |
| image.tag | string | `""` | Image tag |
| imagePullSecrets | list | `[]` | List of secrets for images |
| livenessProbe | object | `{"grpc":{"port":50051},"initialDelaySeconds":30,"periodSeconds":30}` | Define livenessProbe for the deployment |
| nameOverride | string | `""` | Name override for all resources |
| nodeSelector | object | `{}` | Specify the nodeSelector for all pods |
| podAnnotations | object | `{}` | Any extra annotations for all pods |
| podSecurityContext | object | `{}` | Security context override for all pods |
| readinessProbe | object | `{"grpc":{"port":50051,"service":"readiness"},"initialDelaySeconds":30,"periodSeconds":15}` | Define readinessProbe for the deployment |
| replicaCount | int | `1` | Replica count of the deployment |
| resources | object | `{}` | Any resource configuration applied to all pods |
| securityContext | object | `{"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsNonRoot":true,"runAsUser":1000}` | Security context override for all containers |
| service.port | int | `50051` | Port to be exposed on the service |
| service.type | string | `"ClusterIP"` | Service type to be used |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and serviceAccount.create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | Specify the tolerations for all pods |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
