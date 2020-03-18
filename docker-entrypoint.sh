#!/usr/bin/env sh

# alias kubectl='kubectl --kubeconfig='

dockerize -template /tmp/kube-config.yaml.tmpl:/.kube/config

exec kelda "$@"