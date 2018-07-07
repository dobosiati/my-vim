#!/bin/sh

setno=$(grep -nm1 "set nocompatible" ~/.vimrc |cut -f1 -d:)
if [ -z "$setno" ]
then
	{ echo -n "set nocompatible\n"; cat ~/.vimrc; } > ~/.pre.file
	mv ~/.pre.file ~/.vimrc
fi
