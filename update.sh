#!/bin/sh

# Git clone the latest my-vim version
git clone https://github.com/dobosiati/my-vim.git ~/.my-vim/update

# Compaires the new and the old vimrc file sizes and if they are different than override the old one
if [ $(stat -c%s ~/.my-vim/update/new-vim/.vimrc) != $(stat -c%s ~/.vimrc) ]; then	
	cp ~/.my-vim/update/new-vim/.vimrc ~/.vimrc
fi

# Compaires the new and the old plugins file sizes and if they are different than override the old one and installs the plugins
if [ $(stat -c%s ~/.my-vim/update/new-vim/plugins.vim) != $(stat -c%s ~/.vim/plugins.vim) ]; then	
	cp ~/.my-vim/update/new-vim/plugins.vim ~/.vim/plugins.vim
	vim -c 'PluginInstall' -c 'qa!'
fi
 
# Here goes the new dependencies



# Remove update folder
sudo rm -r ~/.my-vim/update
