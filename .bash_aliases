#!/bin/env bash

alias gem='rbenv exec gem'
alias bundle='rbenv exec bundle'
alias rails='rbenv exec bundle exec rails'
alias rake='rbenv exec bundle exec rake'
alias rspec='rbenv exec bundle exec rspec && notify-send "spec passed" \
  || notify-send "spec failed"'
alias ls='ls --color=auto'
alias rackup='rbenv exec bundle exec rackup'
alias unicorn='rbenv exec bundle exec dotenv unicorn -c config/unicorn.rb'
alias sidekiq='rbenv exec bundle exec sidekiq -C config/sidekiq.yml'
alias puma='rbenv exec bundle exec dotenv puma -C config/puma.rb'
alias pry='rbenv exec bundle exec pry -r ./config/environment.rb'
alias jekyll='rbenv exec bundle exec jekyll'

