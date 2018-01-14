#!/bin/env bash

export GIT_PS1_SHOWDIRTYSTATE=1

# shellcheck disable=SC1091
source '/usr/share/git/completion/git-prompt.sh'
PS1="[\[\e[0;36m\]\u\[\e[0m\]]\[\e[0;32m\]"'$(__git_ps1 " (%s)")'"\[\e[0m\] \[\e[0;94m\]\w\[\e[0m\]
$ "
