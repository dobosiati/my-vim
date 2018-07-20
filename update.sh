#!/bin/sh

# Remove update folder if exists
sudo rm -rf ~/.my-vim/update

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
  
# Compaires the new and the old dependencies file sizes and if they are different than override the old one and run it
if [ $(stat -c%s ~/.my-vim/update/dependencies.sh) != $(stat -c%s ~/.my-vim/dependencies.sh) ]; then	
	cp ~/.my-vim/update/dependencies.sh ~/.my-vim/dependencies.sh
	sh ~/.my-vim/dependencies.sh
fi

# Compaires the new and the old colors folder sizes and if they are different than override the old one
if [ $(du -b ~/.my-vim/update/new-vim/colors | cut -c1-5) != $(du -hs ~/.vim/colors | cut -c1-5) ]; then	
	rm ~/.vim/colors/*
	rsync -r ~/.my-vim/update/new-vim/colors/ ~/.vim/colors	
fi

# Compaires the new and the old update file sizes and if they are different than override the old one and run it
if [ $(stat -c%s ~/.my-vim/update/update.sh) != $(stat -c%s ~/.my-vim/update.sh) ]; then	
	cp ~/.my-vim/update/update.sh ~/.my-vim/update.sh
	sh ~/.my-vim/update.sh
fi
 
# Remove update folder if exists
sudo rm -rf ~/.my-vim/update
