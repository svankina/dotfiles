#Source Powerline Bindings.
#. $HOME/.local/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

#Overwrite PS1
# User configuration
export PATH="$HOME/.local/bin:$PATH"
source ~/.bash_aliases
export EDITOR='vim'

#Command History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

#bindkey -v
bindkey '^R' history-incremental-search-backward
