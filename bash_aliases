#!/bin/env bash

alias rails='bundle exec rails'
alias rake='bundle exec rake'
alias rspec='bundle exec rspec'
alias ls='ls --color=auto'
alias rackup='bundle exec rackup'
alias unicorn='bundle exec dotenv unicorn -c config/unicorn.rb'
alias sidekiq='bundle exec sidekiq -C config/sidekiq.yml'
alias puma='bundle exec dotenv puma -C config/puma.rb'
