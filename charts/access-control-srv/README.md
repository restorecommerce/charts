# access-control-srv

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.3](https://img.shields.io/badge/AppVersion-0.1.3-informational?style=flat-square)

A Helm chart for restorecommerce access-control-srv

**Homepage:** <https://docs.restorecommerce.io/access-control-srv/index.html>

## Source Code

* <https://github.com/restorecommerce/access-control-srv>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Specify the affinity for all pods |
| autoscaling.enabled | bool | `false` | Enable HPA |
| autoscaling.maxReplicas | int | `100` | Max amount of replicas for HPA |
| autoscaling.minReplicas | int | `1` | Min amount of replicas for HPA |
| autoscaling.targetCPUUtilizationPercentage | int | `80` | Target CPU usage for HPA |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` | Target memory usage for HPA |
| config.file | string | `"config_production_override.json"` | Name of the file in the config map |
| config.literal | string | `""` | Provide the literal config through this string. Has to be in a JSON format |
| config.name | string | `""` | Name of the config map to be mounted. If specified, config will be appended to the node environment automatically |
| env.extras | list | `[]` | Any extra environment variables appended to all pods |
| env.nodeEnv | string | `"production"` | The selected node environment and config |
| fullnameOverride | string | `""` | Full name override for all resources |
| image.pullPolicy | string | `"IfNotPresent"` | Pull policy of the deployment |
| image.repository | string | `"restorecommerce/access-control-srv"` | Image to be used for deployment |
| image.tag | string | `"0.1.3"` | Image tag |
| imagePullSecrets | list | `[]` | List of secrets for images |
| nameOverride | string | `""` | Name override for all resources |
| nodeSelector | object | `{}` | Specify the nodeSelector for all pods |
| podAnnotations | object | `{}` | Any extra annotations for all pods |
| podSecurityContext | object | `{}` | Security context override for all pods |
| replicaCount | int | `1` | Replica count of the deployment |
| resources | object | `{}` | Any resource configuration applied to all pods |
| securityContext | object | `{}` | Security context override for all containers |
| service.port | int | `50051` | Port to be exposed on the service |
| service.type | string | `"ClusterIP"` | Service type to be used |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and serviceAccount.create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | Specify the tolerations for all pods |
