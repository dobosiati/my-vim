#!/bin/sh

# Create .vimrc file if it is not exist
touch ~/.vimrc

# Set the vim route to .my-vim folder
VIMDIR="let &runtimepath='~/.my-vim'\nlet \$VIMHOME='~/.my-vim'\nlet \$MYVIMRC='~/.my-vim/.vimrc'\n"
{ echo -n $VIMDIR; cat ~/.vimrc; } > ~/.pre.file
mv ~/.pre.file ~/.vimrc

# Set nocompatible to the main .vimsrc if it is not there already
setno=$(grep -nm1 "set nocompatible" ~/.vimrc |cut -f1 -d:)
if [ -z "$setno" ]
then
	{ echo -n "set nocompatible\n"; cat ~/.vimrc; } > ~/.pre.file
	mv ~/.pre.file ~/.vimrc
fi

# Dependencies
sudo apt-get install ctags
sudo apt-get install silversearcher-ag

# Install plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.my-vim/bundle/Vundle.vim
vim -c 'PluginInstall' -c 'qa!'
