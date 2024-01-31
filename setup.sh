#!/bin/bash

dotfiles="$HOME/dotfiles"

#Installing dependencies
echo "Installing dependecies"
sudo pacman -S alacritty zsh git neovim tmux telegram-desktop

# Download dots
cd && git clone https://github.com/danilivanyuk/dotfiles.git

cd $dotfiles
ln -s $HOME/dotfiles/.config/i3 ~/.config
ln -s $HOME/dotfiles/.config/nvim ~/.config
ln -s $HOME/dotfiles/zsh/ ~/
