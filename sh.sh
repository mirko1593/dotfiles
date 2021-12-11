#!/bin/bash

platform="mac"

if [ $# > 0 ] && [ "$1" != "$platform" ]; then
    platform="linux"
fi

vimrc_path="$PWD/$platform/vimrc"

if [ -f $vimrc_path ]; then
    echo "virmc already exist"
else
    echo "will run ln -s $vimrc_path ~/.vimrc"
    ln -s $vimrc_path ~/.vimrc
fi

alias_path="$PWD/$platform/alias"
if [ -f $alias_path ]; then
    echo "alias already exist"
else
    echo "will run ln -s $alias_path ~/.alias"
    ln -s $alias_path ~/.alias
fi

