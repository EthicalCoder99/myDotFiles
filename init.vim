" init.vim

let $NVIM_CONFIG_DIR = expand('$HOME/.config')

if has('nvim-0.5')
    " nightly config
    source $NVIM_CONFIG_DIR/nvim-nightly/nightly.vim
else
    " stable config
    source $NVIM_CONFIG_DIR/nvim/stable.vim
endif
