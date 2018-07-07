#!/bin/sh
git clone https://github.com/dobosiati/my-vim.git ~/my-vim

mv -r ~/.vim/* ~/.my-vim/old-vim
cp -r ~/.my-vim/new-vim/* ~/.vim

# Dependencies
sudo apt-get install ctags
sudo apt-get install silversearcher-ag

# Install plugins
vim -c 'PluginInstall' -c 'qa!'
