#!/bin/bash

platform="mac"

if [ $# > 0 ] && [ "$1" != "$platform" ]; then
    platform="linux"
fi

base_path="$PWD/$platform"
vimrc_path="~/.vimrc"
if [ -f "$vimrc_path" ]; then
    echo "virmc already exist."
else
    echo "will run ln -s "$base_path/vimrc" ~/.vimrc"
    # ln -s $vimrc_path ~/.vimrc
fi

alias_path="$PWD/$platform/alias"
if [ -f "~/.alias" ]; then
    echo "alias already exist"
else
    echo "will run ln -s $alias_path ~/.alias"
    # ln -s $alias_path ~/.alias
fi

vim_dir_path="$PWD/$platform/vim"
if [ -d "~/.vim" ]; then
    echo ".vim directory already exist"
else
    echo "about to run ln -s $vim_dir_path ~/.vim"
fi

