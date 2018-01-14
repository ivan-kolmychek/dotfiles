#!/bin/env bash

export EDITOR=/usr/bin/vim
export SSH_ASKPASS=/usr/bin/ksshaskpass
export BROWSER=/usr/bin/firefox
export HISTCONTROL='ignoreboth'
export GIT_PS1_SHOWDIRTYSTATE=1

# https://wiki.archlinux.org/index.php/Wine#WINEPREFIX
export WINEPREFIX32=~/media/wine32
export WINEPREFIX=$WINEPREFIX32
# https://wiki.archlinux.org/index.php/Wine#WINEARCH
export WINEARCH=win32

# Fix pinentry-tty not working
export GPG_TTY=$(tty)

# shellcheck disable=SC1091
source '/usr/share/git/completion/git-prompt.sh'
PS1="[\[\e[0;36m\]\u\[\e[0m\]]\[\e[0;32m\]"'$(__git_ps1 " (%s)")'"\[\e[0m\] \[\e[0;94m\]\w\[\e[0m\]
$ "
