#!/bin/env zsh

if [[ -f /usr/bin/keychain ]]; then
  eval $(keychain --eval --agents "gpg,ssh")
fi
