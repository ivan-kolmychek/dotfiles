#!/bin/env bash

for file in 'exports' 'aliases' 'rvm' 'keychain'; do
  [ -e "${HOME}/.bash_${file}" ] && source "${HOME}/.bash_${file}"
done
