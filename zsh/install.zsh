#!/usr/bin/env zsh

if [ -f "$HOME/.zsh_dotfiles_init" ]
then
    source "$HOME/.zsh_dotfiles_init"
else
    echo "Could not find '$HOME/.zsh_dotfiles_init'!"
    echo "Execute over-all install script!"
    exit 1
fi

OH_MY_ZSH_REPO="https://github.com/robbyrussell/oh-my-zsh.git"

if [ ! -e "$ZSH" ]
then
    echo "Cloning oh-my-zsh"
    mkdir -p $(dirname $ZSH)
    git clone $OH_MY_ZSH_REPO $ZSH > /dev/null
elif [ -d "$ZSH" ]
then
    echo "Updating oh-my-zsh"
    curdir=$PWD
    cd $ZSH
    git pull > /dev/null
    cd $curdir
else
    echo "$ZSH exists but is not a directory"
fi

if [ -e "$HOME/.zshrc" ]
then
    echo "$HOME/.zshrc exists"
else
    ln -s "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
fi