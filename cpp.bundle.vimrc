set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"" Syntastic can do checks also pymode can
Plugin 'scrooloose/syntastic'
" Clang_Complete to YCM
" Plugin 'Rip-Rip/clang_complete'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'vim-scripts/Conque-GDB'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
"" Replace powerline with airline
"" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/powerline-fonts'
Plugin 'sjl/gundo.vim'
Plugin 'derekwyatt/vim-fswitch'
"Plugin 'vim-scripts/ZoomWin'
Plugin 'regedarek/ZoomWin'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'kien/tabman.vim'
Plugin 'majutsushi/tagbar'
Plugin 'honza/vim-snippets'
" Clang_Complete to YCM
" Plugin 'ervandew/supertab'
Plugin 'vim-scripts/bufexplorer.zip'

" Plugin 'davidhalter/jedi-vim'
" Plugin 'klen/python-mode'
Plugin 'flazz/vim-colorschemes'
"" Only use when cycling through colorschemes
"" Plugin 'biskark/vim-ultimate-colorscheme-utility'
"" Colorsupport works better for me
"" Plugin 'vim-scripts/CSApprox'
Plugin 'vim-scripts/colorsupport.vim'
Plugin 'chrisbra/NrrwRgn'
Plugin 'wesQ3/vim-windowswap'
Plugin 'chrisbra/changesPlugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
