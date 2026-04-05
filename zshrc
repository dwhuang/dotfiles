unalias -a

# Check ls version
if ls --color > /dev/null 2>&1; then
    lsColorFlag=--color
else
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
alias so="source ~/.zshrc"

# Prompt
setopt PROMPT_SUBST
PROMPT='%F{white}%D{%H%M} %F{green}%n%F{red}@%m%F{green}:%~%f$ '