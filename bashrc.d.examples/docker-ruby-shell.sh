#!/bin/env bash

# The $(pwd) should be expanded when alias is used, not at define time.
# shellcheck disable=SC2016
docker_ruby_command='docker run -e "TERM=linux" -it --rm -v "$(pwd):/app" custom-ruby-shell'

# It is expanded at define time, thas is intended.
# shellcheck disable=SC2139
alias docker-ruby="${docker_ruby_command}"

# It is expanded at define time, that is intended.
# shellcheck disable=SC2139
alias ruby-docker="${docker_ruby_command}"
