#!/bin/env bash

# If there is no ~/.bashrc.d directory found, it outputs a warning and
# does pretty much nothing.
#
# If there is a ~/.bashrc.d directory, it loads anything and everything
#that matches ALL of following criterias:
# - is located directly in ~/.bashrc.d (NOT in subdirectory)
# - is a file (or a symlink to a file)
# - has filename ending with ".sh"
#
# Please note that it loads files in alphabetical order. So if you
# care about what is loaded before what, you can use old trick of
# prefixing script names with numbers - for instance, "00-whatever.sh"
# would be loaded before "42-the-answer.sh".

bashrc_d_path="${HOME}/.bashrc.d"

if [ -d "${bashrc_d_path}" ]; then
  results=$(find -L "${bashrc_d_path}/" -maxdepth 1 -name '*.sh' -type f)
  files_to_load=()
  if [ -n "${results}" ]; then
    while read -r line; do
      files_to_load+=("${line}")
    done <<< "$results"
  fi

  for file_to_load in "${files_to_load[@]}"; do
    echo "loading ${file_to_load}..."
    # See https://github.com/koalaman/shellcheck/wiki/SC1090
    # shellcheck source=/dev/null
    source "${file_to_load}"
  done;
else
  echo "====== WARNING ======"
  echo "No ${bashrc_d_path} found, but it was expected."
  echo "Because of this, no config was loaded."
  echo "====================="
fi
