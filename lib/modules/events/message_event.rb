# frozen_string_literal: true

module Ba
  module BaEvents
    module MessageEvent
      extend Discordrb::EventContainer
      message do |event|
        event.message.react('🐑') if event.message.content.downcase =~ /\bba+\b/
      end
    end
  end
end
