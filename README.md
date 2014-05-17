- prefer vim-gtk (nox has no copy to system clipboard, normal vim no python)

- install vundle:
    $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

- use correct vimrc

- powerline-fonts needed for airline:
    https://github.com/Lokaltog/powerline-fonts

- install via fontconfig or (e.g. for xterm) use patched fonts:
    https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation

- xterm needs modification of ~/.Xresources:

        xterm*utf8: 3

        xterm*font: DejaVu Sans Mono for Powerline
        
        xterm*faceName: DejaVu Sans Mono for Powerline
        
        xterm*faceSize: 8

    - apply via: 
    xrdb -merge ~/.Xresources

- vim in terminal needs GUI-color-converter:
    https://github.com/vim-scripts/colorsupport.vim

- lots of color schemes:
    https://github.com/flazz/vim-colorschemes

- for some nice style warnings you need pylint, extend:
    g:pymode_lint_checkers

- disable rope completion if combinging pymode and jedi 
     g:pymode_rope_completion
