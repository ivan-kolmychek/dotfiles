#!/bin/env zsh

new_dir="/opt/chromium-ivan/bin"

if [[ -d "${new_dir}" ]]; then
  export PATH="${PATH}:${new_dir}"
fi
