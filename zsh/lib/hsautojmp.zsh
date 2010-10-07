
HS_AUTOJUMP_HOME="$HOME/.cabal/"
export PATH="$AUTOJUMP_HOME/bin:$PATH"

function autojmp_preexec() {
    { (hsautojmp add "$(pwd -P)"&)>/dev/null 2>>|${HOME}/.hsautojmp_errors ; } 2>/dev/null
}

typeset -ga preexec_functions
preexec_functions+=autojmp_preexec

alias jumpstat="hsautojmp stats"

function j { local new_path="$(hsautojmp match $*)";if [ -n "$new_path" ]; then echo -e "\\033[31m${new_path}\\033[0m"; cd "$new_path";fi }

