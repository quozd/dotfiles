" Disable vi compatibility
set nocompatible

" Disable filetype detection before installing plugins, required by Vundle
filetype off " required by Vundle

" Set up Vundle - plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage vundle :)
Plugin 'gmarik/Vundle.vim'

" General plugins
Plugin 'tpope/vim-fugitive' " Git integration
Plugin 'scrooloose/nerdtree' " Filebrowser
Plugin 'itchyny/lightline.vim' " Enchased status line
Plugin 'mkitt/tabline.vim' " Enchased tab line
Plugin 'xolox/vim-session' " Save opened files on exit
Plugin 'kien/ctrlp.vim' " Go to everything

Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'othree/html5.vim'
Plugin 'mattn/emmet-vim'
Plugin 'xolox/vim-misc'
Plugin 'godlygeek/tabular'

" Languages support
Plugin 'leafgarland/typescript-vim' " Typescript

" Color schemes
Plugin 'chriskempson/base16-vim'
Plugin 'flazz/vim-colorschemes'

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
set so=10

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

" show ruler at 80 char
set colorcolumn=120

" always show the status line
set laststatus=2

" always show tabline
set showtabline=2

" enable syntax highlighting
syntax enable

" show line numbers
set number

" configure indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" use 2 space ident for ruby files
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2 tabstop=2

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

" set default buffer size
set lines=40 columns=160

" configure gui=
"set guioptions-=T  "remove toolbar
"set guioptions-=e " show tabs as in terminal instead of gui tabs
"set guioptions-=L " remove left scrollbar
"set guioptions-=l
"set guioptions-=m " remove menu
" set guioptions-=r  "remove right-hand scroll bar

" turn backup off, since most stuff is in git
set nobackup
set nowb
set noswapfile

" set colorscheme
set background=dark
"colorscheme base16-tomorrow-alt
colorscheme base16-tomorrow

" set font
"set guifont=Consolas:h11:cANSI

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
" let mapleader=","

" Toggle between line numbers and relative line numbers
nnoremap <silent><leader>u :exe "set " . (&relativenumber == 1 ? "norelativenumber" : "relativenumber")<cr>

" toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" move between splits with hjkl
map <C-H> <C-W>h<C-W>
map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>
map <C-L> <C-W>l<C-W>

" ctrp config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

autocmd BufWritePre * :%s/\s\+$//e " trim whitespace on save

" close vim if only window left opened is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" auto restore default vim session on vim start without files without prompt
let g:session_autoload = 'yes'

" auto save default session on vim close without prompt
let g:session_autosave = 'yes'

" auto save session every 10 minutes
let g:session_autosave_periodic = 10

" use modern arrows in nerdtree instead of ascii
let NERDTreeDirArrows=1

" set colorscheme for status line
let g:lightline = { 'colorscheme': 'Tomorrow' }

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$|node_modules\|bower_components\|\.sass-cache\',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" remove bold styling
function! Highlight_remove_attr(attr)
    " save selection registers
    new
    silent! put

    " get current highlight configuration
    redir @x
    silent! highlight
    redir END
    " open temp buffer
    new
    " paste in
    silent! put x

    " convert to vim syntax (from Mkcolorscheme.vim,
    "   http://vim.sourceforge.net/scripts/script.php?script_id=85)
    " delete empty,"links" and "cleared" lines
    silent! g/^$\| links \| cleared/d
    " join any lines wrapped by the highlight command output
    silent! %s/\n \+/ /
    " remove the xxx's
    silent! %s/ xxx / /
    " add highlight commands
    silent! %s/^/highlight /
    " protect spaces in some font names
    silent! %s/font=\(.*\)/font='\1'/

    " substitute bold with "NONE"
    execute 'silent! %s/' . a:attr . '\([\w,]*\)/NONE\1/geI'
    " yank entire buffer
    normal ggVG
    " copy
    silent! normal "xy
    " run
    execute @x

    " remove temp buffer
    bwipeout!

    " restore selection registers
    silent! normal ggVGy
    bwipeout!
endfunction

" autocmd BufNewFile,BufRead * call Highlight_remove_attr("bold")
