#!/bin/env bash

# Fix pinentry-tty not working
export GPG_TTY
GPG_TTY=$(tty)
