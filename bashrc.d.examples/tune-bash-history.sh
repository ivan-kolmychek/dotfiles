#!/bin/env bash

# Limit history size of each shell, 16 commands is usually enough.
export HISTSIZE=16

# Disable cross-shell history, I don't see much real sense in it.
export HISTFILESIZE=0

# Log repitition of same command as one command.
export HISTCONTROL=ignoredups
