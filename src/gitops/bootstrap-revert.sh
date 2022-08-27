#!/usr/bin/env bash

helm uninstall argo-cd \
  --namespace gitops

helm repo remove argo

kubectl delete --all crds

kubectl delete namespace gitops
