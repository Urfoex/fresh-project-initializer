set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
" Clang_Complete to YCM
" Bundle 'Rip-Rip/clang_complete'
Bundle 'Valloric/YouCompleteMe'
" Bundle 'vim-scripts/Conque-GDB'
Bundle 'kien/ctrlp.vim'
Bundle 'SirVer/ultisnips'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'sjl/gundo.vim'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'vim-scripts/ZoomWin'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'kien/tabman.vim'
Bundle 'honza/vim-snippets'
" Clang_Complete to YCM
" Bundle 'ervandew/supertab'
Bundle 'vim-scripts/bufexplorer.zip'


filetype plugin indent on


syntax on
"
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

set number
set cursorline
set laststatus=2
set virtualedit=all
set t_Co=256
set scrolloff=5

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

set colorcolumn=80
set textwidth=80

set ignorecase
set smartcase
set hlsearch
set incsearch

set backspace=indent,eol,start
set history=100 " keep 100 lines of command line history
set noundofile

"set sessionoptions-=curdir
set ssop-=curdir
"set sessionoptions+=sesdir
set ssop+=sesdir
let g:session_directory=getcwd()
let g:session_autosave='no'

set diffopt+=filler
set diffopt+=iwhite
set diffopt+=vertical

set encoding=utf-8
set spelllang=en

set foldcolumn=2
set foldmethod=syntax
set foldlevel=0
" open all folds on file open
au BufRead * normal zR 

" Clang_Complete to YCM
" let g:clang_auto_select=1
" let g:clang_complete_auto=0
" let g:clang_complete_copen=1
" let g:clang_hl_errors=1
" let g:clang_periodic_quickfix=0
" let g:clang_user_options='-std=c++11'
" let g:clang_use_library=1
" let g:clang_snippets = 1
" let g:clang_snippets_engine = 'clang_complete'
" let g:clang_complete_patterns = 1
" let g:clang_complete_macros = 1
" let g:clang_close_preview=1
" let g:clang_auto_user_options="path, .clang_complete, compile_commands.json"
" 
" let g:clang_conceal_snippets=1
set	concealcursor=vin
set conceallevel=2

let g:ycm_confirm_extra_conf = 0
"let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"

let g:syntastic_auto_loc_list=1
let g:syntastic_cpp_compiler_options='-std=c++11'
let g:syntastic_cpp_no_include_search=1

let g:UltiSnipsUsePythonVersion=2
let g:UltiSnipsExpandTrigger="<M-Space>"

let g:Powerline_symbols="fancy"

set completeopt=menu,menuone,longest
" Clang_Complete to YCM
" let g:SuperTabDefaultCompletionType='context'


" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

inoremap <C-Space> <c-x><c-u>
inoremap <C-@> <c-x><c-u>

nnoremap <silent> <F2> :FSHere<CR>
" Clang_Complete to YCM
" nnoremap <silent> <F3> :call g:ClangUpdateQuickFix()<CR>
nnoremap <silent> <F4> :SyntasticCheck<CR>

nnoremap <silent> <F5> :TaskList<CR>
nnoremap <silent> <F6> :NERDTreeToggle<CR>

nnoremap <silent> <F7> :BufExplorerVerticalSplit<CR>
nnoremap <silent> <F8> :TMToggle<CR>
nnoremap <silent> <F9> :TMFocus<CR>
nnoremap <silent> <F11> :GundoToggle<CR>
nnoremap <silent> <F12> :ZoomWin<CR>

nmap <silent> <Leader>of :FSHere<cr>
nmap <silent> <Leader>ol :FSRight<cr>
nmap <silent> <Leader>oL :FSSplitRight<cr>
nmap <silent> <Leader>oh :FSLeft<cr>
nmap <silent> <Leader>oH :FSSplitLeft<cr>
nmap <silent> <Leader>ok :FSAbove<cr>
nmap <silent> <Leader>oK :FSSplitAbove<cr>
nmap <silent> <Leader>oj :FSBelow<cr>
nmap <silent> <Leader>oJ :FSSplitBelow<cr>


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

"""""""""""""""""""
" Custom commands "
"""""""""""""""""""

" Create a new file where the build log will be placed in.
" Reuse the file on future builds.
if !exists(":Build")
	function! BuildIntoBuffer()
		" setlocal autoread
		let tmp_file = fnamemodify("build.log",":p")
		" getcwd() 
		" tempname()
		execute "! echo \"  vim: autoread\" > " . tmp_file
		execute "!ninja -C build >>" . tmp_file
		execute "badd" . tmp_file
		redraw!
	endfunction

	command Build silent call BuildIntoBuffer()
endif
