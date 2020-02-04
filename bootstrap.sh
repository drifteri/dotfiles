#!/usr/bin/env bash

set -e

# Remove old cofigurations
rm -f ~/.zshrc ~/.tmux.conf ~/.emacs

# Create symlinks
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/emacs/.emacs ~/.emacs
