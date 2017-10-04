# some more ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -lA'
alias l='ls -ClFh --hide="*.pyc"'

alias v='vim'
alias c='vimcat'
alias esrc='vim ~/.zshrc'
alias src='source ~/.zshrc'

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

alias py='python -u'

export PYTHONPATH="$PYTHONPATH:~/.local/lib/python2.7/site-packages/"

export EDITOR=vim

export TERM=xterm-256color
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

alias xtar='tar -xvf'
alias ctar='tar -czf'

source ~/.bash_personal

alias rm='trash-put'
alias sai='sudo apt install --assume-yes'
alias pac='sudo pacman'
alias pacs='pacman -Ss'
alias paci='sudo pacman -Sy --noconfirm'

alias eps='v ~/.bash_personal'
alias pys='python -m SimpleHTTPServer'
alias eps='v ~/.bash_personal'

export ASTUDIO_HOME=$HOME/my_apps/android-studio
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

function mkcd {
    mkdir $1 && cd $1
}

alias g+='g++ -std=c++14'


function dbranch {
    git branch -d $1 && git push origin ":$1"
}

function mbranch {
    git checkout -b $1 && git push -u origin $1
}

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

export DEFAULT_USER='svankina'
export PAGER=/usr/bin/vimpager
export BROWSER=firefox
alias less=$PAGER
alias zless=$PAGER
alias yao='yaourt'
alias t='v TODO'
# vim: set ft=sh