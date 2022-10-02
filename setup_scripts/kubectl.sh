#https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
# Kubectl

# Download kubectl binary
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Validate the binary
# Download the kubectl checksum file:
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
# Validate the kubectl binary against the checksum file:
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# Install kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# The kubectl completion script for Zsh can be generated with the command kubectl completion zsh. Sourcing the completion script in your shell enables kubectl autocompletion.
# To do so in all your shell sessions, add the following to your ~/.zshrc file:

# source <(kubectl completion zsh)

# If you have an alias for kubectl, kubectl autocompletion will automatically work with it.
# After reloading your shell, kubectl autocompletion should be working.
# If you get an error like 2: command not found: compdef, then add the following to the beginning of your ~/.zshrc file:

# autoload -Uz compinit
# compinit
