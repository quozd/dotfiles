call plug#begin('~/.config/nvim/plugged')

" General plugins
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'benekastah/neomake'
Plug 'mhinz/vim-grepper'
Plug 'FooSoft/vim-argwrap'
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'

" HTML support
Plug 'othree/html5.vim', { 'for': 'html' }

" Javascript support
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }

" Python support
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

"Plug 'junegunn/vim-easy-align'

call plug#end()

"
" Plugins configuration
"

" Auto start Deoplete
let g:deoplete#enable_at_startup = 1

let g:deoplete#file#enable_buffer_path = 1

" NERDTree configuration
let NERDTreeDirArrows=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize = 50
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" Split window verticaly on UltiSnipsEdit
let g:UltiSnipsEditSplit="vertical"

" Python syntax
let python_highlight_all=1

" Javscript syntax
let g:javascript_plugin_jsdoc = 1

" JSX
let g:jsx_ext_required = 0

" Neomake
"let g:neomake_open_list = 2
let g:neomake_error_sign = {'text': 'E', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': 'W', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '>', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign = {'text': 'i', 'texthl': 'NeomakeInfoSign'}

let g:neomake_javascript_enabled_makers = ['eslint']
let g:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:neomake_javascript_eslint_exe=substitute(g:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

let g:neomake_python_enable_makers = ['pylint']

let g:neomake_verbose = -1

" ArgWrap
let g:argwrap_tail_comma_braces = '['

" Jedi
let g:jedi#use_splits_not_buffers = 0
let g:jedi#completions_enabled = 0

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
set foldmethod=indent
set foldlevel=99

" instant feedback for find & replace
set inccommand=split

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
set background=dark
"let g:hybrid_reduced_contrast = 1
colorscheme badwolf


" Sync " and + registers
set clipboard=unnamedplus

"
" Key mappings
"

" Map leader
let mapleader="\<space>"

" Nerd tree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <silent><leader>f :NERDTreeFind<cr>

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

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Grepper
nnoremap <leader>p :Grepper<cr>

" ArgWrap
nnoremap <silent> <leader>w :ArgWrap<CR>

"
" Autocmd
"

" trim whitespace on save
au BufWritePre * :%s/\s\+$//e

" Toggle between line numbers and relative line numbers
au InsertEnter * :set norelativenumber
au InsertLeave * :set relativenumber

" Run neomake after buf write
autocmd! BufWritePost * Neomake

autocmd FileType python setlocal completeopt-=preview

