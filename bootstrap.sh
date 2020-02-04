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

# Remove old cofigurations
rm -f ~/.zshrc ~/.tmux.conf ~/.emacs

# Create symlinks
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/emacs/.emacs ~/.emacs
