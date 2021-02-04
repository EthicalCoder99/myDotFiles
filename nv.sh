NVIM_RPLUGIN_MANIFEST=$HOME/.local/share/nvim-nightly/rplugin.vim
VIMRUNTIME=$HOME/neovim/runtime $HOME/neovim/build/bin/nvim "$@" -u $HOME/.config/nvim-nightly/nightly.vim
