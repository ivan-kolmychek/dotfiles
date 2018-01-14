#!/bin/env bash

export EDITOR=/usr/bin/vim
export SSH_ASKPASS=/usr/bin/ksshaskpass
export BROWSER=/usr/bin/firefox
export HISTCONTROL='ignoreboth'

# Fix pinentry-tty not working
export GPG_TTY=$(tty)
