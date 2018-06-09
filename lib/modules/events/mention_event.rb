# frozen_string_literal: true

module Ba
  module BaEvents
    module MentionEvent
      extend Discordrb::EventContainer
      mention do |event|
        return if event.author.bot_account?

        event << 'BAAAAAAAAAAA!!!'
        event << ''
        event << "Help command: `#{BA_BOT.prefix}help`"
        event << ''
        event << 'Want to contribute to making me better? Check me out at:'
        event << '<https://github.com/flutterflies/ba>'
        event << ''
        event << 'Add me to your server using this link'
        event << "<#{INVITE_URL}>"
      end
    end
  end
end
