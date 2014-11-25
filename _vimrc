" ============================================================================
"
" Maintainer:
"     Vitali Fokin <vitali.fokin@gmail.com>
"     http://github.com/quozd
"
" Version:
"     0.1 - 1/12/2014
"     0.2 - 4/29/2014
"     0.3 - 11/24/2014
"           Refactoring, extract _vimrc for Windows from .vimrc
"
" Sections:
"     -> 1. General
"     -> 2. UI
"     -> 3. Files and backups
"     -> 4. Plugins
"     -> 5. Colors and fonts
"     -> 6. Keymaps
"     -> 7. Misc
"
" ============================================================================

" = 1. General ===============================================================

set encoding=utf-8
set history=700 " VIM history
set nocompatible " be iMproved
filetype off " required by Vundle

set autoread " auto read file on change from outside

set backspace=indent,eol,start " make backspace working correctly

set hidden " allow Vim to manage multiple buffers effectively

" set powershell as default vim shell
set shell=powershell.exe\ -ExecutionPolicy\ Unrestricted
set shellcmdflag=-Command
set shellpipe=>
set shellredir=>

" = 2. UI ====================================================================

set so=10 " show 10 line to the cursor when moving verticaly
set ruler " always show current position

set ignorecase " ignore case when searching
set smartcase " try to be smart about cases
set hlsearch " hightlight search results

set showmatch " show matching brackets when text indicator is over them

" no annoying sound on errors
set noerrorbells
set novisualbell

set colorcolumn=120 " show ruler at 80 char

set laststatus=2 " always show the status line
set showtabline=2 " always show tabline

syntax enable " enable syntax highlighting

set number " show line numbers

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

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap " don't wrap lines
set linebreak " wrap line at convenient points

set wildmenu " show completion options on <TAB>
set wildmode=list:longest " complete only up to the point of ambiguity

set showmode " show current vim mode
set cursorline " show current cursor line

set lines=40 columns=160
set guioptions-=T  "remove toolbar
set guioptions-=e " show tabs as in terminal instead of gui tabs
set guioptions-=L " remove left scrollbar
set guioptions-=l
set guioptions-=m " remove menu
" set guioptions-=r  "remove right-hand scroll bar

" = 3. Files and backups =====================================================

" turn backup off, since most stuff is in git
set nobackup
set nowb
set noswapfile

" = 4. Plugins ===============================================================

" Vundle init
set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)

Plugin 'gmarik/Vundle.vim'

" original repos on GitHub
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'mkitt/tabline.vim'
Plugin 'othree/html5.vim'
Plugin 'mattn/emmet-vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'PProvost/vim-ps1'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'

" color scheme
Plugin 'chriskempson/base16-vim'
Plugin 'flazz/vim-colorschemes'

" non-GitHub repos
" Plugin 'git://git.wincent.com/command-t.git'

" Git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///Users/gmarik/path/to/plugin'

call vundle#end()

" = 5. Colors and fonts

set background=dark
" colorscheme base16-ocean
colorscheme base16-tomorrow

set guifont=Consolas:h11:cANSI

" = 6. Keymaps ===============================================================

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

" = 7. Misc ==================================================================

autocmd BufWritePre * :%s/\s\+$//e " trim whitespace on save

" close vim if only window left opened is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" auto restore default vim session on vim start without files without prompt
let g:session_autoload = 'yes'

" auto save default session on vim close without prompt
let g:session_autosave = 'yes'

" auto save session every 10 minutes
let g:session_autosave_periodic = 10


" vim-airline configuration
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let NERDTreeDirArrows=1

" unicode symbols
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = 'line:'
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

 " powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = '@'
let g:airline_symbols.readonly = '[ro]'
let g:airline_symbols.linenr = 'line:'

" old vim-powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = '[ro]'
let g:airline_symbols.linenr = 'line:'

let g:airline#extensions#tabline#enabled = 0 " enable enchased tabline
let g:airline#extensions#whitespace#enabled = 0 " disable whitespace errors

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

autocmd BufNewFile,BufRead * call Highlight_remove_attr("bold")
