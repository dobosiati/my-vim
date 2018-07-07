#!/bin/sh

# Remove new-vim files
sudo rm -r ~/.vim/*

# Restore old vim
cp -r ~/.my-vim/old-vim/* ~/.vim

# Restore old vimrc file
cp ~/.my-vim/old-vim/.vimrc ~/.vimrc

# Remove dependencies
sudo apt-get remove ctags
sudo apt-get remove silversearcher-ag

# Remove folder
sudo rm -r ~/.my-vim
