#!/usr/bin/env sh

set -e

command_exists() {
    command -v "$@" >/dev/null 2>&1
}

if ! command_exists zsh; then
    echo "Error: zsh is not installed!"
    exit 1
fi

if ! command_exists tmux; then
    echo "Error: tmux is not installed!"
    exit 1
fi

if ! command_exists emacs; then
    echo "Error: emacs is not installed!"
    exit 1
fi

if ! command_exists git; then
    echo "Error: git is not installed!"
    exit 1
fi

# Clone oh-my-zsh if it does not exist yet
if ! [ -d .oh-my-zsh ]; then
    echo "Cloning oh-my-zsh repository..."
    git clone https://github.com/ohmyzsh/ohmyzsh.git .oh-my-zsh
fi

if ! [ -d .zsh-syntax-highlighting ]; then
    echo "Cloning zsh-syntax-highlighting repository..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .zsh-syntax-highlighting
fi

# Remove old cofigurations
rm -f ~/.zshrc ~/.tmux.conf ~/.emacs

# Create symlinks
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/emacs/emacs ~/.emacs
