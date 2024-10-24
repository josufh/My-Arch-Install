#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias bashconfig='vim ~/.bashrc'
alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'

PS1='\[\e[1;35;1m\]\u is using \h: \W > \[\e[0m\]'

export EDITOR=vim

setfont ter-120b

if [ -f /usr/share/bash-completion/completion ]; then
    . /usr/share/bash-completion/completion
fi

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
