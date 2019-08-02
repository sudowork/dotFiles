#!/bin/bash

DIR="$(pwd)"

function create_symlink() {
    local src_path="$1";
    local dst_path="$2";
    if [ -e "$dst_path" ]; then
        if [ -L "$dst_path" ]; then
            local existing_target="$(readlink "$dst_path")"
            if [ "$src_path" = "$existing_target" ]; then
                echo "Symlink already exists: $(ls -l "$dst_path")"
                return 0
            else
                echo "ERROR - Symlink pointing elsewhere: $(ls -l "$dst_path")"
                return 1
            fi
        else
            echo "ERROR - file exists and is not a symlink: $dst_path"
            return 1
        fi
    else
        echo "Installing $dst_path -> $src_path"
        ln -s "$src_path" "$dst_path"
    fi
}

function is_brew_installed() {
    command -v brew
    return $?
}

function install_brew_package() {
    local package="$1"
    if brew list "$package" > /dev/null; then
        echo "Package $package already installed"
    else
        echo "Installing package $package"
        brew install "$package"
    fi
}

# Ensure submodules updated
echo "Initializing submodules"
git submodule update --init --recursive
echo ""

# brew
echo "Checking Homebrew"
if ! [ -x "$(command -v brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Homebrew already installed. Updating"
    brew update
fi
echo ""

# zsh
echo "Checking zsh"
install_brew_package zsh
echo ""

# oh-my-zsh
echo "Checking oh-my-zsh"
if ! [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "oh-my-zsh already installed"
fi
echo ""

echo "Checking .zshrc"
if [ -f "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc"{,.bak}
    create_symlink "$DIR/zshrc" "$HOME/.zshrc"
fi
echo ""

echo "Checking ZSH_CUSTOM"
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
if [ -d "$ZSH_CUSTOM" ]; then
    mv "$ZSH_CUSTOM"{,.bak}
    create_symlink "$DIR/oh-my-zsh/custom" "$ZSH_CUSTOM"
fi
echo ""

# vim
echo "Checking vim"
install_brew_package vim
create_symlink "$DIR/vim" "$HOME/.vim"
create_symlink "$DIR/vimrc" "$HOME/.vimrc"
echo ""
