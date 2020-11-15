syntax on
filetype indent plugin on

" ---------------------------- Set --------------------------------

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
set incsearch " The matches will be shown while you type.
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set encoding=UTF-8
set relativenumber
set clipboard=unnamedplus
set mouse=a
set ttymouse=xterm2
set laststatus=2
set updatetime=750
set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
set ruler
" Its experimental so please be cautious:
" This settings affects the <esc> key registration.
set timeoutlen=500
set ttimeoutlen=50
" set hlsearch " To highlight all the search pattern matches in a file.
set pastetoggle=<F3> " To turn off auto-indent when pasting text.
" set showtabline=2




" --------------------------- Plugins -----------------------------

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
" Plug 'itchyny/lightline.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
call plug#end()

" -------------------- Custom Settings ----------------------------


colorscheme gruvbox
set background=dark

" " Set color scheme for lightlime.
" let g:lightline = {
"       \ 'colorscheme': 'gruvbox',
"       \ }

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" This is for commenting lines.
nmap <C-_> <Plug>CommentaryLine
vmap <C-_> <Plug>Commentary
" imap <C-_> <Plug>CommentaryLine
" This is for compiling and executing c++ files.

nmap <C-S-m> :!clear && g++ -o %:r %:p && ./%:r<cr>

" NERDTreeToggle
nmap <C-n> :NERDTreeToggle<CR>

" " Open nerd tree when no file is opened in vim.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" " Close vim when only nerd tree is open.
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


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

" Change 2 split windows from vert to horiz ot horiz to vert.
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


" air-line plugin specific commands
" let g:airline_powerline_fonts = 1
" let g:airline_theme='gruvbox'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = ' '
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' '

" Rainbow Parenthesis.
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle"

let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['darkmagenta','cyan','magenta','darkblue','red','lightblue', 'darkyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold','start=/{/ end=/}/ fold']
\}
" \	'separately': {
" \		'*': {},
" \		'markdown': {
" \			'parentheses_options': 'containedin=markdownCode contained', "enable rainbow for code blocks only
" \		},
" \		'lisp': {
" \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], "lisp needs more colors for parentheses :)
" \		},
" \		'haskell': {
" \			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], "the haskell lang pragmas should be excluded
" \		},
" \		'vim': {
" \			'parentheses_options': 'containedin=vimFuncBody', "enable rainbow inside vim function body
" \		},
" \		'perl': {
" \			'syn_name_prefix': 'perlBlockFoldRainbow', "solve the [perl indent-depending-on-syntax problem](https://github.com/luochen1990/rainbow/issues/20)
" \		},
" \		'stylus': {
" \			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], "[vim css color](https://github.com/ap/vim-css-color) compatibility
" \		},
" \		'css': 0, "disable this plugin for css files
" \	}

