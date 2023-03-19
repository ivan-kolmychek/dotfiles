#!/bin/env zsh

source '/usr/share/git/completion/git-prompt.sh'

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"

setopt prompt_subst

PS1='[%F{cyan}%n%f] %F{green}$(__git_ps1 "(%s)")%f %F{blue}%~%f'$'\n''%(~.$.#) '
autoload -U promptinit
promptinit
