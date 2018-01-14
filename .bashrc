#!/bin/env bash

# If there is no ~/.bash.d directory found, it outputs a warning and
# does pretty much nothing.
#
# If there is a ~/.bash.d directory, it loads anything and everything
#that matches ALL of following criterias:
# - is located directly in ~/.bash.d (NOT in subdirectory)
# - is a file
# - has filename ending with ".sh"
#
# Please note that it loads files in alphabetical order. So if you
# care about what is loaded before what, you can use old trick of
# prefixing script names with numbers - for instance, "00-whatever.sh"
# would be loaded before "42-the-answer.sh".

bash_d_path="${HOME}/.bash.d"

if [ -d "${bash_d_path}" ]; then
  results=$(find "${bash_d_path}/" -maxdepth 1 -name '*.sh' -type f)
  while read -r line; do
    echo "loading ${line}..."
    # See https://github.com/koalaman/shellcheck/wiki/SC1090
    # shellcheck source=/dev/null
    source "$line"
  done <<< "$results"
else
  echo "====== WARNING ======"
  echo "No ${bash_d_path} found, but it was expected."
  echo "Because of this, no config was loaded."
  echo "====================="
fi
