
#init bash completion
autoload bashcompinit
bashcompinit

PROMPT='%(!.%1~ #.[%n]%1~ $) '

bindkey -v
bindkey ' ' magic-space

[ -d $HOME/.zsh/bash_completion ] && {
    for bs in `ls $HOME/.zsh/bash_completion`; do
        source "$HOME/.zsh/bash_completion/$bs"
    done
}

alias mkdir='mkdir -p'
alias grep='grep --color=auto'

alias rdo="su root -c"

if [ "$ARCH" = 'darwin' ]; then
    alias textedit='open -a TextEdit'
    alias safari='open -a Safari'
    alias firefox='open -a Firefox'
    alias chrome='open -a Google\ Chrome'
    alias itunes='open -a iTunes'
    alias browser=chrome
else
    alias browser=firefox
fi

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

alias ls='ls -G -b'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lal='ls -la'
alias lla='ls -la'
alias -- +='pushd .'
alias -- -='popd'
alias o='less'
alias zo='zless'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias -g G='|& grep --color=auto -i'
alias -g L='|& less'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g DN=/dev/null
alias -g LL="2>&1 | less"
alias -g V="|& vim -R -"

alias lsempty='ls -ld **/*(/^F)'
alias lsd='ls -lfd *(/)'
alias lsnew='ls -lfd *(om[1,10])'
alias lsnewd='ls -lfd *(/om[1,10])'
alias lsnewf='ls -lfd *(.om[1,10])'
alias lsold='ls -lfd *(Om[1,10])'
alias lsoldd='ls -lfd *(/om[1,10])'
alias lsoldf='ls -lfd *(.om[1,10])'

alias lsbig='ls -lfd *(.OL[1,10])'
alias lssmall='ls -lfd *(.oL[1,10])'

alias -s html=browser
alias -s com=browser
alias -s org=browser
alias -s de=browser
alias -s net=browser

alias -s hs=yi

oleo() {
    browser "http://dict.leo.org/ende?lang=de&lp=ende&search=$*"
}

dwicti()  { browser http://de.wiktionary.org/wiki/${(C)1// /_} }
ewicti()  { browser http://en.wiktionary.org/wiki/${(C)1// /_} }

ggogle()  { browser "http://groups.google.com/groups?q=$*" }
google()  { browser "http://www.google.com/search?&num=100&q=$*" }

hoogle()  { browser "http://www.haskell.org/hoogle/?hoogle=$*" }
hayoo() { browser "http://holumbus.fh-wedel.de/hayoo/hayoo.html#0:$*" }

swikide()   { browser http://de.wikipedia.org/wiki/Spezial:Search/${(C)1} }
swikien()   { browser http://de.wikipedia.org/wiki/Spezial:Search/${(C)1} }

wikide() { browser http://de.wikipedia.org/wiki/"${(C)*}" }
wikien()  { browser http://en.wikipedia.org/wiki/"$*" }


hsdoc() {
    for n in "$@"; do
        f="$HOME/.cabal/share/doc/$n/html/index.html"
        [ -f "$f" ] && browser "$f" || echo "no doc found for: $n"
    done

}

_hsdoc() {
    _files -W $HOME/.cabal/share/doc -/
}

compdef _hsdoc hsdoc

greph () { history 0 | grep $1 }

mcd() { mkdir -p "$@"; cd "$@" }
cl() { cd $1 && ls }

# search for various types or README file in dir and display them in $PAGER
# function readme() { $PAGER -- (#ia3)readme* }
readme() {
    local files
    files=(./(#i)*(read*me|lue*m(in|)ut)*(ND))
    if (($#files))
    then $PAGER $files
    else
        print 'No README files.'
    fi
}

