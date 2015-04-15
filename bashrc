#!/bin/env bash
export EDITOR=/usr/bin/vim
export SSH_ASKPASS=/usr/bin/ksshaskpass
export BROWSER=/usr/bin/firefox

eval $(keychain --eval --agents ssh)

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias rails='bundle exec rails'
alias rake='bundle exec rake'
alias rspec='bundle exec rspec'
alias ls='ls --color=auto'
alias rackup='bundle exec rackup'
alias unicorn='bundle exec dotenv unicorn -c config/unicorn.rb'
alias sidekiq='bundle exec sidekiq -C config/sidekiq.yml'
alias puma='bundle exec dotenv puma -C config/puma.rb'

export HISTCONTROL='ignoreboth'
