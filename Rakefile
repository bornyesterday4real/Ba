# frozen_string_literal: false

require './lib/ba_bot'

desc 'Run the bot'
task :run do
  sh 'bundle exec ruby lib/quote_me.rb'
rescue Interrupt
  exit
end
