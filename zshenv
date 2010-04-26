
export EDITOR=vim

export ARCH=`uname -s 2>/dev/null | tr '[:upper:]' '[:lower:]'`

setenv() { export $1=$2 }  # csh compatibility

setopt AUTO_CD
setopt C_BASES
setopt APPEND_HISTORY
setopt histignorealldups 
setopt histsavenodups
setopt sharehistory
setopt shortloops
setopt autocontinue

# by default, we want this to get set.
# Even for non-interactive, non-login shells.
if [ "`id -gn`" = "`id -un`" -a `id -u` -gt 99 ]; then
	umask 002
else
	umask 022
fi

# set auto completion
zstyle ':completion:*' completer _expand _complete _approximate _match _correct 
zstyle ':completion:*' completions 1
zstyle ':completion:*' file-sort name
zstyle ':completion:*' glob 1
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '+' '+m:{a-zA-Z}={A-Za-z}' '+r:|[._-]=** r:|=**' '+l:|=* r:|=*'
zstyle ':completion:*' max-errors 2 not-numeric
zstyle ':completion:*' original true
zstyle ':completion:*' prompt 'errors: %e'
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/etc/zshrc'

autoload -U compinit
compinit

#init bash completion
autoload bashcompinit
bashcompinit

[ -d $HOME/.zsh/bash_completion ] && {
    for bs in `ls $HOME/.zsh/bash_completion`; do
        source "$HOME/.zsh/bash_completion/$bs"
    done
}

# load libraries

[ -d "$HOME/.zsh/lib" ] && {
    for h in `ls "$HOME/.zsh/lib"`; do
        source "$HOME/.zsh/lib/$h"
    done
}

export PATH="$HOME/bin:$PATH"

#export PAKCS_HOME=$HOME/dateien/src/pakcs
#export PATH="$PATH:$PAKCS_HOME/bin"

# export PATH="$PATH:$HOME/uni/uebb/parsergen/bin"

# 
export PATH="$PATH:$HOME/.private/bin"
export MANPATH="$HOME/.private/share/man:$MANPATH"

