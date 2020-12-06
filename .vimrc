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
set timeout
set ttimeout
set timeoutlen=3000
set ttimeoutlen=50
" set hlsearch " To highlight all the search pattern matches in a file.
set pastetoggle=<F3> " To turn off auto-indent when pasting text.
" set showtabline=2 
set wildmenu    " it will provide a graphical menu of all the matches you can cycle
set showmatch     " highlight matching [{()}]
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" set foldmethod=indent   " fold based on indent level
" set foldmethod=manual

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
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'tpope/vim-surround'
call plug#end()

" -------------------- Custom Settings ----------------------------


colorscheme gruvbox
set background=dark


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

" Close vim when only nerd tree is open.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Change the key mapping for navigating through splits.
set splitbelow splitright
" Make leader key as <Space>.
let mapleader = " "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" We won't use this in tmux.
" noremap <silent> <C-Left> :vertical resize +3<CR>
" noremap <silent> <C-Right> :vertical resize -3<CR>
" noremap <silent> <C-Up> :resize -3<CR>
" noremap <silent> <C-Down> :resize +3<CR>

"Tab navigation keys.
nmap <C-l> gt
nmap <C-h> gT
nnoremap <C-t> :tabnew<CR>

" This key binding is for inserting new line in vim without exiting the normal mode.
" You can use 3 <leader> o to insert 3 lines below the cursor. This is just an
" example.
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

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

" This is to stop the weird behaviour of vim with tmux.
" P.S this are the key bindings for the fzf plugin.
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Bracey
let g:bracey_refresh_on_save=1

" To start live server.
" :Bracey
" To stop live server.
" :BraceyStop
" To reload live server.
" :BraceyReload


" CTRL-P
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


" Folds
" Use indent fold in manual fold method.
 augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

