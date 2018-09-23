#!/bin/env bash

# The $(pwd) should be expanded when alias is used, not at define time.
# shellcheck disable=SC2016
docker_phoenix_new_command='docker run -e "TERM=linux" -it --rm -v "$(pwd):/app" phoenix-new'

# It is expanded at define time, thas is intended.
# shellcheck disable=SC2139
alias docker-phoenix-new="${docker_phoenix_new_command}"

# It is expanded at define time, that is intended.
# shellcheck disable=SC2139
alias phoenix-new-docker="${docker_phoenix_new_command}"
