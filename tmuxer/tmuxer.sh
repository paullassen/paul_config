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

# If not in tmux, run the tmuxer launcher
if [ -z $TMUX ]; then
    source $HOME/.config/tmuxer/launcher.sh
fi

# Define mkcd function
mkcd() {
    mkdir -p "$1" && cd "$1"
}
# py function to alias python3
py() {
    python3 "$@"
}
ask() { 
	echo "$1" | chatgpt-cli chat --model gpt-4-1106-preview
}
cmd() {
	echo "$1" | chatgpt-cli chat --system-message "Provide only the bash command that would solve this problem without any formatting or other text"
}

