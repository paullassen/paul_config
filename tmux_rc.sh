#--------------------------------------
#--------Start Personal Config---------
#--------------------------------------
# 
# Define mkcd function
mkcd() {
    mkdir -p "$1" && cd "$1"
}

#Set Prompt to show USER@HOST<TIME>:DIR$ 
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;35m\]<\D{%H:%M:%S}>\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

# If .tmux.src exists, source it
if [ -f "$(pwd)/.tmux.src" ]; then
  source .tmux.src
fi

# Use local history file at session start directory
export HISTFILE=$(pwd)/.tmux_history

# If not int tmux, run the tmux launcher
if [ -z $TMUX ]; then
    source ~/.tmux/launcher.sh
fi

# py function to alias python3
py() {
    python3 "$@"
}

#--------------------------------------
#---------End Personal Config----------
#--------------------------------------
