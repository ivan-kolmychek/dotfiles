#!/bin/zsh

# Set default browser.
# Can conflict with anything else that sets default browser.
# Please note that many apps do ignore $BROWSER env var.

browser_bin="/usr/bin/firefox"

if [[ -f "${browser_bin}" ]]; then
  export BROWSER="${browser_bin}"
fi
