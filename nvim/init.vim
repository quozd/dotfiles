call plug#begin('~/.config/nvim/plugged')

" General plugins
Plug 'quozd/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim'
"Plug 'itchyny/lightline.vim' " Enchased status line

" HTML support
Plug 'othree/html5.vim', { 'for': 'html' }

" Javascript support
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }

"Plug 'junegunn/vim-easy-align'

call plug#end()

"
" Plugins configuration
"

" Auto start Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'file', 'ultisnips']

let g:deoplete#file#enable_buffer_path = 1

" NERDTree configuration
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']

" Split window verticaly on UltiSnipsEdit
let g:UltiSnipsEditSplit="vertical"

"
" Env variables
"

"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $FZF_DEFAULT_COMMAND='ag -g ""'

"
" Python host config
"

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

"
" Common settings
"

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
syntax on
set ignorecase
set smartcase
set incsearch
set showmatch
set noerrorbells
set novisualbell
set laststatus=2
set number
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set scrolloff=5

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap

" show completion options on <TAB>
set wildmenu
" complete only up to the point of ambiguity
set wildmode=list:longest

" turn backup off, since most stuff is in git
set nobackup
set nowb
set noswapfile

" set colorscheme
let base16colorspace=256
set background=dark
colorscheme base16-tomorrow

" Sync " and + registers
set clipboard=unnamedplus

"
" Key mappings
"

" Map leader
let mapleader=","

" Nerd tree
map <C-n> :NERDTreeToggle<CR>

" Toggle between line numbers and relative line numbers
nnoremap <silent><leader>u :exe "set " . (&relativenumber == 1 ? "norelativenumber" : "relativenumber")<cr>

" FZF
nnoremap <silent><C-P> :Files<CR>
"nnoremap <silent><Leader><Enter>  :Buffers<CR>

" move between splits with hjkl
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" Remove search highlight on Enter
nnoremap <silent> <CR> :nohlsearch<CR><CR>

" Don't loose selection on < or >
xnoremap <  <gv
xnoremap >  >gv

" Normal mode for terminal
:tnoremap <Esc> <C-\><C-n>

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"
" Autocmd
"

" trim whitespace on save
au BufWritePre * :%s/\s\+$//e

" File types
au BufRead,BufNewFile *.es6 setfiletype javascript

" Toggle between line numbers and relative line numbers
au InsertEnter * :set norelativenumber
au InsertLeave * :set relativenumber

