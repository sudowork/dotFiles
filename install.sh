#!/bin/sh

remote="https://github.com/sudowork/dotfiles.git"
dir="dotfiles"
full_path="$HOME/.$dir"

if [ ! -d $full_path ]; then
    echo "Installing dotfiles for the first time"
    git clone $remote $full_path
    cd $full_path
    [ "$1" = "ask" ] && export ASK="true"
    make install
else
    echo "dotfiles are already installed"
fi
