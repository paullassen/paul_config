#!/usr/bin/env bash

sudo apt update
sudo apt install git \
		 curl \
		 neovim \
		 tmux \
		 gawk \
		 -y
curl -s https://deb.nodesource.com/setup_16.x | sudo bash
sudo apt install nodejs -y
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")

mkdir  -p $HOME/.tmux/session/example
cp -r $DIR/tmux/* $HOME/.tmux/
ln -s $DIR/tmux.conf $HOME/.tmux.conf

mkdir -p $HOME/.config/nvim
ln -s $DIR/init.vim $HOME/.config/nvim/init.vim
cat $DIR/tmux_rc >> $HOME/.bashrc
