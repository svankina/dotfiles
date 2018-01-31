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

#bindkey -v

#Prompt
autoload -U colors && colors
#Overwrite PS1
PS1="%{$fg_bold[red]%}%n$fg_bold[white] 🜨 $fg_bold[blue]%2~%\ $fg_bold[yellow]%}$%{$reset_color%} % "

if [ "$TMUX" = "" ]; then tmux; fi

if [ -n "$VIRTUAL_ENV" ]; then
    source $VIRTUAL_ENV/bin/activate;
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
