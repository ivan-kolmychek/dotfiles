#!/bin/bash

if [ -d "${HOME}/.rebar3/bin" ]
then
  export PATH="${PATH}:${HOME}/.rebar3/bin"
else
  echo "!!! WARNING: no rebar3 bin directory found, expected it at ${HOME}/.rebar3/bin"
  echo "Either it should be created or rebar bashrc.d script removed"
fi
