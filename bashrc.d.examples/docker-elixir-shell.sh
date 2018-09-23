#!/bin/env bash

# The $(pwd) should be expanded when alias is used, not at define time.
# shellcheck disable=SC2016
docker_elixir_command='docker run -e "TERM=linux" -it --rm -v "$(pwd):/app" custom-elixir-shell'

# It is expanded at define time, thas is intended.
# shellcheck disable=SC2139
alias docker-elixir="${docker_elixir_command}"

# It is expanded at define time, that is intended.
# shellcheck disable=SC2139
alias elixir-docker="${docker_elixir_command}"
