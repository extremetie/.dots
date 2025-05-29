#!/bin/sh

export DOTS=$(dirname $(realpath $0))

# - ~/
ln -sf $DOTS/config/.bash_profile $HOME/.bash_profile
ln -sf $DOTS/config/.bashrc $HOME/.bashrc
ln -sf $DOTS/config/.xinitrc $HOME/.xinitrc

# d ~/.config
mkdir $HOME/.config
ln -sf $DOTS/config/gtk-3.0 $HOME/.config
ln -sf $DOTS/config/nvim $HOME/.config
ln -sf $DOTS/config/ranger $HOME/.config

# - ~/.local/bin
mkdir -p $HOME/.local/bin
ln -sf $DOTS/bin/bat.sh $HOME/.local/bin/bat
ln -sf $DOTS/bin/libnotify_lowbat.sh $HOME/.local/bin/libnotify_lowbat
ln -sf $DOTS/bin/dwm_status.sh $HOME/.local/bin/dwm_status

echo 0
