#!/bin/bash
# chmod +x ./setup.sh

dotfiles="$HOME/dotfiles"


cd $dotfiles
# ln -s $HOME/dotfiles/config/i3 ~/.config
ln -s $HOME/dotfiles/config/nvim ~/.config
ln -s $HOME/dotfiles/config/alacritty ~/.config
ln -s $HOME/dotfiles/config/zed ~/.config
ln -s $HOME/dotfiles/.tmux.conf ~/
ln -s $HOME/dotfiles/.zshrc ~/
ln -s $HOME/dotfiles/.zshrc.pre-oh-my-zsh ~/
ln -s $HOME/dotfiles/zsh/ ~/
