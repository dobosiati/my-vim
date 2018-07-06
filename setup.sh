#!/bin/sh

# Set the vim route to .my-vim folder
VIMDIR="let &runtimepath='~/.my-vim'\nlet \$VIMHOME='~/.my-vim'\nlet \$MYVIMRC='~/.my-vim/.vimrc'\n"
{ echo -n $VIMDIR; cat ~/.vimrc; } > ~/.pre.file
mv ~/.pre.file ~/.vimrc

# Dependencies
sudo apt-get install ctags
sudo apt-get install silversearcher-ag

# Install plugins
vim -c 'PluginInstall' -c 'qa!'
