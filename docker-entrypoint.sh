#!/usr/bin/env sh

# alias kubectl='kubectl --kubeconfig='

dockerize -template /tmp/kube-config.yaml.tmpl:/.kube/config
dockerize -template /tmp/kelda-config.yaml.tmpl:/.kelda.yaml

exec kelda "$@"