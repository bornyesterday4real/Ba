# frozen_string_literal: true

require 'discordrb'
require 'ostruct'
require 'yaml'

module Ba
  CONFIG = OpenStruct.new YAML.load_file 'config/config.yml'
  CONFIG.token = ENV['TOKEN']

  if CONFIG.token.empty?
    puts 'Discord auth token not set, unable to start bot'
    puts 'Exiting...'
    exit
  end

  BA_BOT = Discordrb::Commands::CommandBot.new(token: CONFIG.token,
                                               prefix: CONFIG.command_prefix)
  INVITE_URL = "#{BA_BOT.invite_url}&permissions=#{CONFIG.permissions}"

  Discordrb::LOGGER.info 'Welcome to Ba!'
  Discordrb::LOGGER.info 'Use ctrl+C to safely exit.'
  Discordrb::LOGGER.info "Use this link to invite your bot: #{INVITE_URL}"

  def self.load_module(name, path)
    new_module = Module.new
    const_set name, new_module
    Dir["lib/modules/#{path}/*.rb"].each { |file| load file }
    new_module.constants.each do |mod|
      BA_BOT.include! new_module.const_get(mod)
    end
  end
  load_module :BaEvents, 'events'
  load_module :BaCommands, 'commands'

  Signal.trap 'INT' do
    Discordrb::LOGGER.info 'Exiting...'
    Discordrb::LOGGER.info 'Have a nice day!'
    # rubocop:disable Lint/HandleExceptions
    begin
      BA_BOT.stop
    rescue ThreadError
    end
    # rubocop:enable Lint/HandleExceptions
    exit
  end

  BA_BOT.run
end
