echo "Setting up Vim for C++ development..."
rm -rf ~/.vim
rm -rf ~/.vimrc
hg clone https://bitbucket.org/Urfoex/fresh-project-initializer ~/projects/fresh-project-initializer
cd ~/projects/fresh-project-initializer
mkdir ~/projects/fresh-project-initializer/cpp.vim
mkdir ~/projects/fresh-project-initializer/py.vim
ln -fs ~/projects/fresh-project-initializer/cpp.vim ~/.vim
ln -fs ~/projects/fresh-project-initializer/cpp.bundle.vimrc ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qa
ln -fs ~/projects/fresh-project-initializer/cpp.vimrc ~/.vimrc

echo "Setting up Powerline-Fonts..."
cd ~/.vim/bundle/powerline-fonts
~/.vim/bundle/powerline-fonts/install.sh
cat >> ~/.Xresources << EOL
xterm*utf8: 3
xterm*font: DejaVu Sans Mono for Powerline
xterm*faceName: DejaVu Sans Mono for Powerline
xterm*faceSize: 8
EOL
xrdb -merge ~/.Xresources
echo "If something looks a bit off you may need to set the font in your terminal to a powerline one yourself."

echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!! Be sure to have libclang and boost installed... !!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
cd ~/.vim/bundle/YouCompleteMe
~/.vim/bundle/YouCompleteMe/install.sh --clang-completer --system-libclang --system-boost

echo "Done."
