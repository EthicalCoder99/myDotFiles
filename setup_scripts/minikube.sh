# https://minikube.sigs.k8s.io/docs/start/
# https://docs.altinity.com/clickhouseonkubernetes/kubernetesinstallguide/minikubeonlinux/
# Minikube

# Download minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

# Install minikube
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# To correct issues with the kube-proxy and the storage-provisioner, set nf_conntrack_max=524288 before starting minikube:
sudo sysctl net/netfilter/nf_conntrack_max=524288