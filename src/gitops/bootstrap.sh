#!/usr/bin/env bash

kubectl create namespace gitops

helm repo add argo https://argoproj.github.io/argo-helm

helm install argo-cd argo/argo-cd \
  --values src/gitops/argocd/values.yaml \
  --namespace gitops \
  --create-namespace \
  --version 5.3.6
