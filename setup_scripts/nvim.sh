# Install the nvim from the official github page
# https://github.com/neovim/neovim 
sudo dpkg -i package_file.deb


# Follow the instructions from this.
# https://github.com/neovim/neovim/wiki/Installing-Neovim

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor