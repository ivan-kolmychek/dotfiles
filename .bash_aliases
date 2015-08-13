#!/bin/env bash

alias rails='bundle exec rails'
alias rake='bundle exec rake'
alias rspec='bundle exec rspec && notify-send "spec passed" || notify-send "spec failed"'
alias ls='ls --color=auto'
alias rackup='bundle exec rackup'
alias unicorn='bundle exec dotenv unicorn -c config/unicorn.rb'
alias sidekiq='bundle exec sidekiq -C config/sidekiq.yml'
alias puma='bundle exec dotenv puma -C config/puma.rb'
alias pry='bundle exec pry -r ./config/environment.rb'

