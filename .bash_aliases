# some more ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -lA'
alias l='ls -ClFh --hide="*.pyc"'

alias v='vim'
alias c='cat'
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
alias gp='git push'

function gcm() {
    local message="$@";
    git commit -m "$message";
}

export WORKON_HOME=~/Envs
source ~/.local/bin/virtualenvwrapper.sh

alias tm='tmux -u -2'
alias ta='tmux attach'
alias td='tmux detach'
alias tl='tmux list-sessions'
alias evim='vim ~/.vimrc'
alias emux='vim ~/.tmux.conf'

alias py='python'
export PATH="$HOME/opt/bin:$HOME/.local/bin:$PATH"

export PYTHONPATH="$PYTHONPATH:~/.local/lib/python2.7/site-packages/"
# Powerline
#source $HOME/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

export EDITOR=vim

if [ -n "$VIRTUAL_ENV" ]; then
  . "$VIRTUAL_ENV/bin/activate"
fi

export TERM=xterm-256color
export PATH=${PATH}:$HOME/my_apps/jdk1.8.0_92/bin
export PATH=${PATH}:$HOME/my_apps/android-sdk-linux/tools:$HOME/my_apps/android-sdk-linux/platform-tools

export ANDROID_HOME=$HOME/my_apps/android-sdk-linux/

function x {
    xdg-open $1 > /dev/null 2>&1 &
}

function da {
    date -d @$1
}

alias elias='v ~/.bash_aliases'

export PYTHONSTARTUP=~/.pythonrc

alias windows='sudo grub-reboot 2 && sudo reboot'

alias xtar='tar -xvf'
alias ctar='tar -czf'

source ~/.bash_personal

export PATH=$PATH:$HOME/my_apps/my_scripts/
alias cli='$HOME/my_apps/cliist/cliist.py'

alias rm='trash-put'
alias sai='sudo apt-get install --assume-yes'
alias ios='ionic serve'

alias eps='v ~/.bash_personal'
alias pys='python -m SimpleHTTPServer'
alias eps='v ~/.bash_personal'

alias geny='$HOME/my_apps/genymotion/genymotion'
#eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
alias p3='python3'
alias t="v TODO"


export MY_APPS=$HOME/my_apps
export ASTUDIO_HOME=$HOME/my_apps/android-studio
export SCALA_HOME=$HOME/my_apps/scala-2.11.8
export NODE_HOME=$MY_APPS/node
export PATH=$PATH:$SCALA_HOME/bin:$ASTUDIO_HOME/bin:$NODE_HOME/bin

function mkcd {
    mkdir $1 && cd $1
}

alias g++='g++ -std=c++14'

alias chromium-browser="/usr/bin/chromium-browser --disable-session-crashed-bubble --disable-infobars"

function dbranch {
    git branch -d $1 && git push origin ":$1"
}

function mbranch {
    git checkout -b $1 && git push -u origin $1
}
alias q='$HOME/q/l32/q'
alias studio='$HOME/my_apps/android-studio/bin/studio.sh > /dev/null 2>&1 &'
alias sai='sudo apt install -y'
alias sup="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && notify-send 'Done Updating'"

alias ei3='v $HOME/.config/i3/config'
alias cfg='/usr/bin/git --git-dir=$HOME/wksp/dotfiles --work-tree=$HOME'
alias cfgu="cfg add -u && cfg commit -m 'updates' && cfg push"
#config config status.showUntrackedFiles no

function sendfile() {
    tar cf - $1 | nc -w 3 $2 1234
}

function receive_file() {
    nc -l -p 1234 | pv -b | tar xvf -
}

# vim: set ft=sh
