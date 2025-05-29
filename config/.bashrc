#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi

RESET='\033[0m'
BLUE='\033[36m'
PS1="[$BLUE\u@\h \W$RESET]\$ "

alias bc='bc -lq'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias rm='rm -i'
alias vim='nvim'
