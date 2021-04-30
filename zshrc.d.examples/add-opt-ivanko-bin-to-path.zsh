#!/bin/env zsh

new_dir="/opt/ivanko/bin"

if [[ -d "${new_dir}" ]]; then
  export PATH="${PATH}:${new_dir}"
fi
