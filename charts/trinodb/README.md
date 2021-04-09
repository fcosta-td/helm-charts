# TrinoDB Helm Chart

![Version: 1.0.2](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![AppVersion: 354](https://img.shields.io/badge/AppVersion-354-informational?style=flat-square)

## Get Repo Info

```console
helm repo add trinodb https://fcosta-td.github.io/helm-charts
helm repo update
```

_See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release fcosta-td/trinodb
```

## Uninstalling the Chart

To uninstall/delete the my-release deployment:

```console
helm delete my-release
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| connectors | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"trinodb/trino"` |  |
| image.securityContext.runAsGroup | int | `1000` |  |
| image.securityContext.runAsUser | int | `1000` |  |
| image.tag | int | `351` |  |
| nodeSelector | object | `{}` |  |
| resources | object | `{}` |  |
| server.config.http.port | int | `8080` |  |
| server.config.path | string | `"/etc/trino/"` |  |
| server.config.query.maxMemory | string | `"3GB"` |  |
| server.config.query.maxMemoryPerNode | string | `"1GB"` |  |
| server.config.query.maxTotalMemory | string | `"6GB"` |  |
| server.config.query.maxTotalMemoryPerNode | string | `"2GB"` |  |
| server.jvm.gcMethod.g1.heapRegionSize | string | `"32M"` |  |
| server.jvm.gcMethod.type | string | `"UseG1GC"` |  |
| server.jvm.maxHeapSize | string | `"7G"` |  |
| server.log.trino.level | string | `"INFO"` |  |
| server.node.dataDir | string | `"/data/trino"` |  |
| server.node.environment | string | `"production"` |  |
| server.node.pluginDir | string | `"/usr/lib/trino/plugin"` |  |
| server.workers | int | `3` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |
