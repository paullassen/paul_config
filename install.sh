#!/usr/bin/env bash

sudo apt update
sudo apt install neovim tmux gawk -y

SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")

mkdir  -p $HOME/.tmux/session/example
cp -r $DIR/tmux/* $HOME/.tmux/
cp $DIR/tmux.conf $HOME/.tmux.conf
cat $DIR/tmux_rc >> $HOME/.bashrc
