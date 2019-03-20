" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

syntax on

set number relativenumber
set history=600
set undolevels=600
set ruler

let mapleader = ","

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

set smarttab

autocmd Filetype c,cpp,cc,proto setlocal tabstop=2 shiftwidth=2 expandtab

set ai
set si
set wrap

set so=7
set hlsearch
set incsearch
set magic
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

syntax enable

set nobackup
set nowritebackup
set noswapfile

set lbr
set tw=500

map 0 ^

" Plugin settings start here
" IMPORTANT: the first step is installing vim-plug (https://github.com/junegunn/vim-plug)
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'rust-lang/rust.vim'

call plug#end()

" => nerdtree
" autocmd vimenter * NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" let g:NERDTreeWinPos = "right"
map <C-n> :NERDTreeToggle<CR>

" => ctrlp
map <C-p> :CtrlP<CR>

" =========================================================
" other shortcuts
" =========================================================
map <F4> :%!xxd<CR>
map <F5> :%!xxd -r<CR>
map j gj
map k gk
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

nmap <leader>w :w!<cr>
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext
" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation
" easier formatting of paragraphs
vmap Q gq
nmap Q gqap
