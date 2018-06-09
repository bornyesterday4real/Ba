# frozen_string_literal: true

module Ba
  module BaCommands
    module StatCommands
      extend Discordrb::Commands::CommandContainer
      command(:num_servers) do |event|
        unless event.author.id == CONFIG.bot_owner
          author = event.author
          event << "I'm sorry #{author.mention}, you cannot run this command."
          event << 'You must be the bot owner to user this command'
          return
        end

        event << "Ba is currently running on #{BA_BOT.servers.size} servers"
      end
    end
  end
end
