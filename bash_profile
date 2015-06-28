unalias -a

# Check ls version
if ls --color > /dev/null 2>&1; then 
    # GNU version
    lsColorFlag=--color
else 
    # OSX version
    lsColorFlag=-G
    export CLICOLOR=1
    export LSCOLORS=Exfxcxdxbxegedabagacad
fi
# Aliases
alias ls="ls -Fv ${lsColorFlag}"
alias la="ls -Fva ${lsColorFlag}"
alias psg="ps -ajxww | grep"
alias rm="rm -i"
alias ssh="ssh -2"
alias sshy="ssh -2Y"
alias so="source ~/.bash_profile"
if [ "`uname`" = "Darwin" ]; then
    alias vim="mvim"
fi

# Path
pathCheckList=(
    ~/.bin
    /opt/local/bin
    /opt/local/sbin
    /opt/local/lib/postgresql93/bin
    ~/Library/Python/2.7/bin
)
# Add path if exists
path=
for p in "${pathCheckList[@]}"; do
    if [ -d $p ]; then
        if [ -z $path ]; then
            path=$p
        else
            path=$path:$p
        fi
    fi
done
if [ ! -z $path ]; then
    export PATH=$path:$PATH
fi

export TERM=xterm-256color
export EDITOR=vim

# for running epxect script to telnet bbs
if [ -z $LANG ]; then
	# when the terminal is using non-unicode (big5) encoding,
	# LANG will be set to empty string and LC_* will be set to C locale
	export LANG=en_US.ISO8859-1
fi

# this is for leda, the library containing method to generate random planar 
# graph; needed for generating cmsc420 project test cases
#export LEDAROOT=/Users/dwhuang/Arsenal/420/leda
#export PATH=$PATH:$LEDAROOT/Manual/cmd

# command prompt
export PS1="\[\033[37m\]\$(date +%H%M) \[\033[32m\]\u\[\033[31m\]@\h\[\033[32m\]:\w\[\033[m\]$ "

# bash completion
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

if [ -d /Applications/MacPorts/MacVim.app ]; then
    export VIM_APP_DIR=/Applications/MacPorts
fi
