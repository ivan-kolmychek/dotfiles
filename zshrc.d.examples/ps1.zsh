#!/bin/env zsh

git_prompt() {
 ref=$(git symbolic-ref HEAD | cut -d'/' -f3)
 echo $ref
}

source '/usr/share/git/completion/git-prompt.sh'

export GIT_PS1_SHOWDIRTYSTATE=true

setopt prompt_subst

PS1='[%F{cyan}%n%f] %F{green}$(__git_ps1 "(%s)")%f %F{blue}%~%f'$'\n''%(~.$.#) '
autoload -U promptinit
promptinit
