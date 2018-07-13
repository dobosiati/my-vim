#!/bin/sh

# Create vimrc file if it is not exist
touch ~/.vimrc
# Create .vim folder if it is not exist
mkdir -p .vim

# Saving current vim by copying to the my-vim folder
mv ~/.vim/* ~/.my-vim/old-vim
# Move the new vim
cp -r ~/.my-vim/new-vim/* ~/.vim

# Save old vimrc file
mv ~/.vimrc ~/.my-vim/old-vim/.vimrc
# Copy the new vimrc file
cp ~/.my-vim/new-vim/.vimrc ~/.vimrc

# Dependencies
sudo apt-get install ctags
sudo apt-get install silversearcher-ag

# Install plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c 'PluginInstall' -c 'qa!'

# Install the dependencies in the update file
sh update.sh
