#!/bin/env zsh

if [[ -f /usr/bin/keychain ]]; then
  eval $(keychain --eval)
fi
