call plug#begin(stdpath('data') . '/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'

" Python syntax
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Syntx
Plug 'jvirtanen/vim-hcl'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colorscheme
Plug 'wadackel/vim-dogrun'

call plug#end()

syntax on

set termguicolors
set encoding=utf-8
set autoread
set backspace=indent,eol,start
set ruler
set colorcolumn=120
set showmode
set cursorline
set history=1000
set hidden
set relativenumber
set number
set ignorecase
set smartcase
set incsearch
set showmatch
set noerrorbells
set novisualbell
set laststatus=2
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set scrolloff=5
set foldmethod=indent
set foldlevel=99
set nowrap
set mouse=a

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" turn backup off, since most stuff is in git
set nobackup
set nowb
set noswapfile

" Sync " and + registers
set clipboard=unnamedplus

colorscheme dogrun

"
" Plugins configuration
"

" NERDTree configuration
let g:NERDTreeWinSize = 70
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" FZF
let g:fzf_layout = { 'window': 'enew' }
let $FZF_DEFAULT_COMMAND='ag -g ""'

"
" Key mappings
"

" Map leader
let mapleader=","

" move between splits with hjkl
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" Toggle between line numbers and relative line numbers
nnoremap <silent><leader>u :exe "set " . (&relativenumber == 1 ? "norelativenumber" : "relativenumber")<cr>

" Nerd tree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <silent><leader>f :NERDTreeFind<cr>

" FZF
nnoremap <silent><C-P> :Files<CR>

" Don't loose selection on < or >
xnoremap <  <gv
xnoremap >  >gv

" Remove search highlight on Enter
nnoremap <silent> <CR> :nohlsearch<CR><CR>

" Terminal
:tnoremap <Esc> <C-\><C-n>

"
" Commands
"

au BufNewFile,BufRead *.py command! Rename Semshi rename

"
" Autocmd
"

" trim whitespace on save
au BufWritePre * :%s/\s\+$//e

" Toggle between line numbers and relative line numbers
au InsertEnter * :set norelativenumber
au InsertLeave * :set relativenumber

