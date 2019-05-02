#!/bin/env bash

# The $(pwd) should be expanded when alias is used, not at define time.
# shellcheck disable=SC2016
docker_node_command='docker run -e "TERM=linux" -it --rm -v "$(pwd):/app" custom-node-shell'

# It is expanded at define time, thas is intended.
# shellcheck disable=SC2139
alias docker-node="${docker_node_command}"

# It is expanded at define time, that is intended.
# shellcheck disable=SC2139
alias node-docker="${docker_node_command}"
