" Disable vi compatibility
set nocompatible

" Disable filetype detection before installing plugins, required by Vundle
filetype off " required by Vundle

let mapleader=","

" Set up Vundle - plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage vundle :)
Plugin 'gmarik/Vundle.vim'

" General plugins
Plugin 'editorconfig/editorconfig-vim' " Editorconfig support
Plugin 'tpope/vim-fugitive' " Git integration
Plugin 'scrooloose/nerdtree' " Filebrowser

" toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" close vim if only window left opened is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" use modern arrows in nerdtree instead of ascii
let NERDTreeDirArrows=1
" show hidden files in nerdtree
let NERDTreeShowHidden=1

Plugin 'scrooloose/nerdcommenter' " Comment code
Plugin 'itchyny/lightline.vim' " Enchased status line

" set colorscheme for status line
"let g:lightline = { 'colorscheme': '16color' }

Plugin 'kien/ctrlp.vim' " Go to everything

" ctrp config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|target|dist|log|tmp|bower_components)|(\.(swp|ico|git|svn|sass-cache))$',
  \ 'file': '\v\.(exe|so|dll|log|DS_Store|dat)$'
  \ }

Plugin 'Shougo/neocomplete.vim'

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=tern#Complete

Plugin 'SirVer/ultisnips'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

Plugin 'rking/ag.vim'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'

" Languages support
Plugin 'othree/html5.vim'
Plugin 'Valloric/MatchTagAlways'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'

Plugin 'mxw/vim-jsx'

let g:jsx_ext_required = 0

" Color schemes
Plugin 'chriskempson/base16-vim'

" Finish plugins installation
call vundle#end()

" Enable filetype detection
filetype plugin indent on

" Set encoding to utf-8
set encoding=utf-8

" Set vim history lenght to 700 commands
set history=700

" auto read file on change from outside
set autoread

" make backspace working correctly
set backspace=indent,eol,start

" allow Vim to manage multiple buffers effectively
set hidden

" show 10 line to the cursor when moving verticaly
"set so=10

" always show current position
set ruler

" ignore case when searching
set ignorecase

" try to be smart about cases
set smartcase

" hightlight search results
set hlsearch

" show matching brackets when text indicator is over them
set showmatch

" no annoying sound on errors
set noerrorbells
set novisualbell

" show ruler at 120 char
set colorcolumn=120

" always show the status line
set laststatus=2

" always show tabline
set showtabline=1

" enable syntax highlighting
syntax enable

" show line numbers
set number

" configure indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" don't wrap lines
set nowrap

" wrap line at convenient points
set linebreak

" show completion options on <TAB>
set wildmenu

" complete only up to the point of ambiguity
set wildmode=list:longest

" show current vim mode
set showmode

" show current cursor line
set cursorline

" turn backup off, since most stuff is in git
set nobackup
set nowb
set noswapfile

" set colorscheme
set background=dark
colorscheme base16-tomorrow-alt

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

au BufNewFile,BufRead *.jbuilder call s:setf('ruby')
au BufRead,BufNewFile *.es6 setfiletype javascript
