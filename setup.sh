#!/bin/sh

touch ~/.vimrc

mv ~/.vim/* ~/.my-vim/old-vim
cp -r ~/.my-vim/new-vim/* ~/.vim

mv ~/.vimrc ~/.my-vim/old-vim/.vimrc
mv ~/.my-vim/.new-vim/.vimrc ~/.vimrc

# Dependencies
sudo apt-get install ctags
sudo apt-get install silversearcher-ag

# Install plugins
vim -c 'PluginInstall' -c 'qa!'
