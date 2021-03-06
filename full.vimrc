set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdcommenter'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/powerline-fonts'

Plugin 'sjl/gundo.vim'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'

Plugin 'chrisbra/NrrwRgn'
Plugin 'chrisbra/changesPlugin'

" use newer http://www.vim.org/scripts/script.php?script_id=356
"Plugin 'vim-scripts/dbext.vim'
Plugin 'JLimperg/Align'
Plugin 'jphustman/SQLUtilities'

Plugin 'tpope/vim-fugitive'
Plugin 'AndrewRadev/linediff.vim'
Plugin 'will133/vim-dirdiff'
Plugin 'chrisbra/vim-diff-enhanced'

Plugin 'Valloric/YouCompleteMe'
" Plugin 'klen/python-mode'
Plugin 'scrooloose/syntastic'

" Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'IngoHeimbach/semantic-highlight.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

set termguicolors
colorscheme molokai

set number
set relativenumber
set cursorline
set cursorcolumn
set laststatus=2
set virtualedit=all
" set t_Co=256
set scrolloff=5
set sidescrolloff=1
set tabpagemax=30
set switchbuf=usetab
set splitright
set splitbelow

" works with Konsole
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

set showcmd
set showmatch
set wildmenu
set hidden

set smartindent
set autoindent
set cindent
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set wrap
set colorcolumn=80,120
set textwidth=120

set ignorecase
set smartcase
set hlsearch
set incsearch

runtime! macros/matchit.vim

set backspace=indent,eol,start
set history=100 " keep 100 lines of command line history
set undofile
set clipboard+=unnamed

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$
set formatoptions+=j

set sessionoptions-=curdir
set sessionoptions-=options
"set ssop-=curdir
set sessionoptions+=sesdir
"set ssop+=sesdir
let g:session_directory=getcwd()
let g:session_autosave='no'

set diffopt+=filler
set diffopt+=iwhite
set diffopt+=vertical

set encoding=utf-8
set spelllang=en

set complete+=t
set formatoptions-=t

set foldcolumn=2
set foldmethod=syntax
set foldlevel=0
" open all folds on file open
au BufRead * normal zR

set concealcursor=vin
set conceallevel=2

set completeopt=menu,menuone,longest

if has('gui_running')
    set guioptions=aMgh
endif


" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

inoremap <C-Space> <c-x><c-u>
inoremap <C-@> <c-x><c-u>

map <C-PAGEUP> :bp<CR>
map <C-PAGEDOWN> :bn<CR>

nnoremap <silent> <F4> :SyntasticCheck<CR>
nnoremap <silent> <F5> :SemanticHighlightToggle<CR>


" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif


let g:ycm_confirm_extra_conf = 0
"let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"

let g:syntastic_auto_loc_list=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8', 'pycodestyle', 'pydocstyle', 'pyflakes', 'pylint', 'python']
let g:syntastic_aggregate_errors = 1
let g:syntastic_cpp_compiler_options='-std=c++1z'
let g:syntastic_cpp_no_include_search=1

let g:syntastic_mode_map = {
	\ "mode": "passive",
	\ "active_filetypes": [],
	\ "passive_filetypes": [] }

let g:semanticEnableFileTypes=['javascript', 'typescript', 'ruby', 'php', 'python', 'coffee', 'c', 'cpp', 'java', 'rust']