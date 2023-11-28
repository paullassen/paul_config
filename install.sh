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

# Install nodejs
curl -s https://deb.nodesource.com/setup_16.x | sudo bash
sudo apt install nodejs -y
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install fzf
git clone github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Create ssh-key
ssh-keygen -t ed25519 
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Install personal config
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")

mkdir  -p $HOME/.tmux/session/example
cp -r $DIR/tmux/* $HOME/.tmux/
ln -s $DIR/tmux.conf $HOME/.tmux.conf

mkdir -p $HOME/.config/nvim
ln -s $DIR/init.vim $HOME/.config/nvim/init.vim
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "# from github.com/paullassen/paul_config"  >> $HOME/.bashrc
echo "source $SCRIPT_DIR/tmux_rc.sh" >> $HOME/.bashrc
