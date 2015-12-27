call plug#begin('~/.config/nvim/plugged')

" General plugins
Plug 'quozd/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'itchyny/lightline.vim' " Enchased status line

" HTML support
Plug 'othree/html5.vim', { 'for': 'html' }

" Javascript support
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }

"Plug 'junegunn/vim-easy-align'

call plug#end()

let mapleader=","

" NERDTree configuration
map <C-n> :NERDTreeToggle<CR>
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $FZF_DEFAULT_COMMAND='ag -g ""'

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
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

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

" Toggle between line numbers and relative line numbers
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
nnoremap <silent><leader>u :exe "set " . (&relativenumber == 1 ? "norelativenumber" : "relativenumber")<cr>

" FZF
nnoremap <silent><C-P> :Files<CR>
"nnoremap <silent><Leader><Enter>  :Buffers<CR>

" move between splits with hjkl
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

"autocmd BufWritePre * :%s/\s\+$//e " trim whitespace on save

" File types
au BufRead,BufNewFile *.es6 setfiletype javascript
