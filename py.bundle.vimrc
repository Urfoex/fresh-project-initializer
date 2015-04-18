set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

source ~/projects/fresh-project-initializer/base.bundle.vimrc
Plugin 'davidhalter/jedi-vim'
Plugin 'klen/python-mode'
Plugin 'jaxbot/semantic-highlight.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
