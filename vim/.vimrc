set nocompatible

filetype plugin indent on
set encoding=utf-8
set history=700
set autoread
set backspace=indent,eol,start
set ruler
set ignorecase
set smartcase
set hlsearch
set showmatch
set noerrorbells
set novisualbell
set colorcolumn=120
set laststatus=2
syntax enable
set number
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set nowrap
set showmode
set cursorline
set relativenumber

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nobackup
set nowb
set noswapfile

set background=dark

" Toggle between line numbers and relative line numbers
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
nnoremap <silent><leader>u :exe "set " . (&relativenumber == 1 ? "norelativenumber" : "relativenumber")<cr>

" move between splits with hjkl
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

autocmd BufWritePre * :%s/\s\+$//e " trim whitespace on save