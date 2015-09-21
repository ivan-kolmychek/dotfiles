#!/bin/env bash

for file in 'exports' 'aliases' 'keychain' 'rbenv'; do
  [ -e "${HOME}/.bash_${file}" ] && source "${HOME}/.bash_${file}"
done
