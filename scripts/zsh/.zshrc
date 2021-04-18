# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

alias python="python3"
alias keyboard-on="echo 2 | sudo tee /sys/class/leds/asus::kbd_backlight/brightness"
alias keyboard-off="echo 0 | sudo tee /sys/class/leds/asus::kbd_backlight/brightness"

deb(){sudo dpkg -i $1} 

mkcd(){
    mkdir $1
    cd $1
}

create-venv(){
	 python3 -m venv $1
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/anton/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/anton/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/anton/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/anton/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

