require 'telegram/bot'
require './library/database'
require './modules/listener'
require './modules/security'

# Entry point class
class FishSocket
  include Database
  def initialize
    super
    # Initialize BD
    Database.setup
    # Establishing webhook via @gem telegram/bot, using API-KEY
    Telegram::Bot::Client.run(ENV['TOKEN']) do |bot|
      # Start time variable, for exclude message what was sends before bot starts
      start_bot_time = Time.now.to_i
      # Active socket listener
      bot.listen do |message|
        # Processing the new income message    #if that message sent after bot run.
        Listener.catch_new_message(message,bot) if Listener::Security.message_is_new(start_bot_time,message)
      end
    end
  end
end
# Bot start
FishSocket.new