## ALIASES ##
alias start-cam="sudo killall VDCAssistant"
########

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

#add colour to terminal
#http://it.toolbox.com/blogs/lim/how-to-fix-colors-on-mac-osx-terminal-37214
#CLICOLOR=1 simply enables coloring of your terminal.
#LSCOLORS=... specifies how to color specific items.
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#*// GIT auto completion
source `brew --prefix git`/etc/bash_completion.d/git-completion.bash

PATH=$HOME/.rbenv/shims:/usr/local/bin:/usr/local/sbin:~/.bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH
export PATH

# Add tre-find
alias tree-dir="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

#For rbenv
eval "$(rbenv init -)"

## Function to view CSV files nicely in terminal
function csv_view {
    column -s ${2:-,} -t < $1 | less -#2 -N -S
}

# Add brew bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

source ~/.bin/tmuxinator.bash

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

## Get full file path for the file
fp () {
    PHYS_DIR=`pwd -P`
    RESULT=$PHYS_DIR/$1
    echo $RESULT | pbcopy
    echo $RESULT
}
