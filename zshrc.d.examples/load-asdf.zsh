#!/bin/env zsh

if [[ -d $HOME/.asdf/ ]]; then
  source $HOME/.asdf/asdf.sh
  fpath=(${ASDF_DIR}/completions $fpath)
fi
