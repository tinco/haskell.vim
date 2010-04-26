
PROMPT='%(!.%1~ #.[%n]%1~ $) '

bindkey -v
bindkey ' ' magic-space

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi

