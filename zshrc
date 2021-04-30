# Lines configured by zsh-newuser-install

setopt extendedglob nomatch notify
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install

# load config from dir

zshrc_d_path="${HOME}/.zshrc.d"

if [ -d "${zshrc_d_path}" ]; then
  results=$(find -L "${zshrc_d_path}/" -maxdepth 1 -name '*.zsh' -type f | sort)
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
  echo "No ${zshrc_d_path} found, but it was expected."
  echo "Because of this, no config was loaded."
  echo "====================="
fi
