#!/usr/bin/env bash

kubectl create namespace gitops

helm repo add argo https://argoproj.github.io/argo-helm

helm install argo-cd argo/argo-cd \
  --values src/gitops/argo-cd/values.yaml \
  --namespace gitops \
  --create-namespace \
  --version 5.3.6

sed 's/{{ .Values.targetRevision }}/main/g' src/gitops/root-app/templates/application-root-app.yaml |
  kubectl apply -f - --namespace gitops
