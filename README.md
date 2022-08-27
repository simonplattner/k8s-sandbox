# Kubernetes sandbox

This is the GitOps repository for my sandbox kubernetes cluster. For now, it targets a single node cluster that runs on
my developer computer.

## Bootstrap

### Prerequisites

1. Kubernetes cluster that you have access to (Kubernetes v1.24+)
2. Installed kubectl command line tool
3. Installed Helm (Helm v3.9+)

### How to bootstrap

1. Execute the bootstrap script `src/gitops/bootstrap.sh`
2. Forward argo ui port to localhost `kubectl port-forward service/argo-cd-argocd-server -n gitops 8080:443`
3. Find generated argo admin password: `kubectl -n gitops get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`
4. Login to argo ui under `http://localhost:8080/` (user: `admin`, password from previous step)
