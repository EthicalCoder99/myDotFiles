syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set wrap
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set encoding=UTF-8
set relativenumber
set clipboard=unnamedplus
set mouse=a
set laststatus=2
set updatetime=750

" set showtabline=2
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

colorscheme gruvbox
set background=dark

" Set color scheme for lightlime.
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] 

" This is for commenting lines.
nmap <C-_> <Plug>CommentaryLine
vmap <C-_> <Plug>Commentary
" imap <C-_> <Plug>CommentaryLine
" This is for compiling and executing c++ files.
nmap <C-S-b> :!clear && g++ -o %:r %:p && ./%:r<cr>

" NERDTreeToggle
nmap <C-n> :NERDTreeToggle<CR>

" Open nerd tree when no file is opened in vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim when only nerd tree is open.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Change the key mapping for navigating through splits.
set splitbelow splitright
let mapleader = " "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>

"Tab navigation keys.
nmap <C-l> gt
nmap <C-h> gT
nnoremap <C-t> :tabnew<CR>

map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

" This is for Snippets.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" trigger `autoread` when files changes on disk
      set autoread
      autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
    autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
