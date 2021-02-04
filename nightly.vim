set runtimepath-=~/.config/nvim
set runtimepath-=~/.config/nvim/after
set runtimepath-=~/.local/share/nvim/site
set runtimepath-=~/.local/share/nvim/site/after

set runtimepath+=~/.config/nvim-nightly/after
set runtimepath^=~/.config/nvim-nightly
set runtimepath+=~/.local/share/nvim-nightly/site/after
set runtimepath^=~/.local/share/nvim-nightly/site

syntax on
set nu
set mouse=a
call plug#begin('~/.config/nvim-nightly/plugged')
Plug 'joshdick/onedark.vim'
call plug#end()

colorscheme onedark

