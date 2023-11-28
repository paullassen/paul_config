#!/usr/bin/env bash

sudo apt update
# Install core utilities
sudo apt install git \
		 curl \
		 neovim \
		 tmux \
		 gawk \
         silversearcher-ag \
         tree \
		 -y

# Install build tools
sudo apt install build-essential \
         cmake \
         python3-dev \
         python3-pip \
         python3-setuptools \
         python3-wheel \
         python3-venv \
         -y

# # Install nodejs
# curl -s https://deb.nodesource.com/setup_16.x | sudo bash
# sudo apt install nodejs -y
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# 
# # Install fzf
# git clone https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install
# 
# # Create ssh-key
# ssh-keygen -t ed25519 
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_ed25519

# Install personal config
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
TMUXER_DIR=$HOME/.config/tmuxer
TMUX_DIR=$HOME/.config/tmux
NVIM_DIR=$HOME/.config/nvim

mkdir  -p $TMUXER_DIR/session/example
mkdir -p $TMUX_DIR
mkdir -p $NVIM_DIR
# Iterate over all files in tmux folder and create symlinks
for file in $DIR/tmux/*; do
    ln -s $file $HOME/.config/tmux/$(basename $file)
done
# Iterate over all files in tmuxer folder and create symlinks
for file in $DIR/tmuxer/*; do
    ln -s $file $HOME/.config/tmuxer/$(basename $file)
done
# Iterate over all files in nvim folder and create symlinks
for file in $DIR/nvim/*; do
    ln -s $file $HOME/.config/nvim/$(basename $file)
done

echo "# from github.com/paullassen/paul_config"  >> $HOME/.bashrc
echo "source $HOME/.config/tmuxer/tmuxer.sh" >> $HOME/.bashrc
