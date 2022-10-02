# github-ssh setup
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
ssh-keygen -t ed25519 -C "rahulsahoo66@gmail.com"

# Check if ssh-agent is working or not
eval "$(ssh-agent -s)"
# O/P: Agent pid <id>

ssh-add ~/.ssh/id_ed25519

# Then copy the content of ~/.ssh/id_ed25519.pub to this address
# https://github.com/settings/ssh