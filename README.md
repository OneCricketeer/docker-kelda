kelda-cli
===

Installs `kelda` and configures `kubectl` for a k8s cluster that is running the Kelda Minion. 

Variables
---

|Name|Description|
|-|-|
|`KELDA_USER_TOKEN`|Sets the `user.token` value for the Kelda account|
|`K8S_SERVER`|The k8s API server endpoint|
|`K8S_CA_DATA`|The k8s API `certificate-authority-data` (if cluster uses `https`, **which it definitely should**)|
|`K8S_NAMESPACE`|(optional) Sets a `context.namespace` value.|
|`KELDA_USERNAME`|Sets the `user.name` value for the Kelda account (default: `kelda-user`)|
|`KELDA_NAMESPACE`|The namespace to use for `kelda dev`|

Running
---

Without Sync

```sh
docker run --rm kelda-cli \
  -e K8S_SERVER= ... \
  -e KELDA_NAMESPACE=$(whoami) \
  -v /path/to/workspace.yaml:/workspace.yaml:ro \
  -v /path/to/src:/app:ro dev --no-sync
```

[With Sync](https://kelda.io/docs/configuring-kelda/sync/overview/) (requires `kelda.yaml` in your source directory)

```sh
docker run --rm kelda-cli \
  -e K8S_SERVER= ... \
  -e KELDA_NAMESPACE=$(whoami) \
  -v /path/to/workspace.yaml:/workspace.yaml:ro \
  -v /path/to/src:/app:ro dev
```
