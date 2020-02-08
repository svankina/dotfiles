#Source Powerline Bindings.
#. $HOME/.local/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

# User configuration
export PATH="$HOME/.local/bin:$PATH"
source ~/.bash_aliases
export EDITOR='vim'

#Command History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

bindkey -e


export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libgtk3-nocsd.so.0
autoload bashcompinit
bashcompinit
eval "$(register-python-argcomplete pmbootstrap)"


#Prompt
autoload -U colors && colors
#Overwrite PS1
PS1="%{$fg_bold[red]%}%n$fg_bold[white] 🜨 $fg_bold[blue]%2~%\ $fg_bold[yellow]%}$%{$reset_color%} % "

if [ -n "$VIRTUAL_ENV" ]; then
    source $VIRTUAL_ENV/bin/activate
fi

if [ "$TMUX" = "" ]; then
    tmux;
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
