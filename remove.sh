#!/bin/sh

# Remove folder
rm -r ~/.my-vim

# Remove dependencies
sudo apt-get remove ctags
sudo apt-get remove silversearcher-ag

num1=$(grep -nm1 "let &runtimepath='~/.my-vim'" ~/.vimrc |cut -f1 -d:)
num2=$(grep -nm1 "let \$VIMHOME='~/.my-vim'" ~/.vimrc |cut -f1 -d:)
num3=$(grep -nm1 "let \$MYVIMRC='~/.my-vim/.vimrc'" ~/.vimrc |cut -f1 -d:)
sed -e "$num1 d;$num2 d;$num3 d;" ~/.vimrc > ~/.pre.file
mv ~/.pre.file ~/.vimrc
