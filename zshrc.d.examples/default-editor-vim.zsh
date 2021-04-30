#!/bin/env zsh

# Set system editor.
# Can conflict with other scripts that set up $EDITOR.
# Please note that many apps do ignore $EDITOR env var.

export editor_bin="/usr/bin/vim"

if [[ -f "${editor_bin}" ]]; then
  export EDITOR="${editor_bin}"
fi
