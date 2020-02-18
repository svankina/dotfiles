#Source Powerline Bindings.
#. $HOME/.local/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

# User configuration
export PATH="$HOME/.local/bin:$PATH"
source ~/.bash_aliases
export EDITOR='vim'
if [ "$TMUX" = "" ]; then
    tmux;
fi

#Command History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

bindkey -e


#export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libgtk3-nocsd.so.0

#Prompt
autoload -U colors && colors
#Overwrite PS1
PS1="%{$fg_bold[red]%}%n$fg_bold[white] 🜨 $fg_bold[blue]%2~%\ $fg_bold[yellow]%}$%{$reset_color%} % "

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

eval "$(direnv hook zsh)"
