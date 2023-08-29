# some more ls aliases
export TERMINAL=gnome-terminal
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -lA'
alias l='ls -ClFh --hide="*.pyc"'
alias lh='ls -lAhrt'

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

#export VIRTUALENV_PYTHON=python3
#export WORKON_HOME=~/Envs
#source ~/.local/bin/virtualenvwrapper.sh

#alias tm='tmux -u'
#alias ta='tmux attach'
#alias td='tmux detach'
#alias tl='tmux list-sessions'
alias ta='todolist add'
alias tl='todolist list'
alias tmc='todolist mark complete'
alias tma='todolist mark active'
alias tmo='todolist mark open'
alias tmf='todolist mark failed'
alias te='todolist edit'
alias evim='vim ~/.vimrc'
alias emux='vim ~/.tmux.conf'
alias py='python3 -u'

export EDITOR=vim
export PATH=$PATH:/usr/local/go/bin

export TERM=xterm-256color

function x {
    xdg-open $1 > /dev/null 2>&1 &
}

function da {
    date -d @$1
}

alias elias='v ~/.bash_aliases'

export PYTHONSTARTUP=~/.pythonrc

alias xtar='tar -xvf'
alias ctar='tar -cvzf'

source ~/.bash_personal

alias rm='trash-put'
alias sai='sudo apt install --assume-yes'

alias eps='v ~/.bash_personal'
alias eps='v ~/.bash_personal'

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

function mc {
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
    tar cvf - $1 | nc -w 3 $2 1234
}

function receive_file() {
    nc -l -p 1234 | pv -b | tar xvf -
}

function prog() {
    echo "$@ & progress -mp $!"
}

export DEFAULT_USER='svankina'
export PAGER=/usr/bin/vimpager
export BROWSER=chromium
alias less=$PAGER
alias zless=$PAGER
alias yao='yaourt'
alias t='v todo.txt'
alias mmi="make && make install && notify-send 'Done installing'"
alias _='sudo'
alias geta='geth attach http://localhost:8545'
alias p3='python3'
#export PYTHONWARNINGS="ignore"

export CUDAROOT=/usr/local/cuda-10.2
export PATH=$PATH:$CUDAROOT/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDAROOT/lib64
alias ipy='ipython'
alias wh='which'
alias sudo='sudo '
alias docker='sudo docker'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/svankina/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/svankina/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/svankina/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/svankina/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

function ctarp () {
tar cf - $1 -P | pv -s $(du -sb $1 | awk '{print $1}') | gzip > $2
}

function pipa () {
    pip install $1 && echo $1 >> requirements.txt
}

# vim: set ft=sh
