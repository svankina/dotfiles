# some more ls aliases
alias ll='ls -alF'
alias la='ls -lA'
alias l='ls -ClFh'

alias v='vim'
alias esrc='vim ~/.zshrc'
alias src='source ~/.zshrc'

#Open nautilus in background, silently.
function nau() {
(nautilus "$*" &) &> /dev/null
}

function slm() {
(subl -b "$*" &) &> /dev/null
}

alias gpr='git pull --rebase'
alias ga='git add'
alias gd='git diff'
alias gco='git checkout'
alias gs='git status'
alias gf='ga $_'

export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

alias tm='tmux -u -2'
alias ta='tmux attach'
alias td='tmux detach'
alias tl='tmux list-sessions'
alias evim='vim ~/.vimrc'
alias emux='vim ~/.tmux.conf'

alias py='python'
export PATH="/home/svankina/opt/bin:/home/svankina/.local/bin:$PATH"

export PYTHONPATH="$PYTHONPATH:~/.local/lib/python2.7/site-packages/"
# Powerline
source /home/svankina/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

export EDITOR=vim

if [ -n "$VIRTUAL_ENV" ]; then
  . "$VIRTUAL_ENV/bin/activate"
fi

export TERM=xterm-256color
export PATH=${PATH}:/usr/lib/jvm/java-7-openjdk-amd64/bin/
export PATH=${PATH}:/home/svankina/my_apps/android-sdk-linux/tools
export ANDROID_HOME=/home/svankina/my_apps/android-sdk-linux/

function x {
    xdg-open $1 > /dev/null 2>&1 &
}

alias elias='v ~/.bash_aliases'

export PYTHONSTARTUP=~/.pythonrc

alias windows='sudo grub-reboot 2 && sudo reboot'

alias xtar='tar -xvf'
alias ctar='tar -czf'

# vim: set ft=sh
