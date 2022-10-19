class FishSocket
  module Listener
    # This module assigned to responses from bot
    module Response
      def std_message(message, chatid = false )
        chat = (defined?Listener.message.chat.id) ? Listener.message.chat.id : Listener.message.message.chat.id
        chat = chatid if chatid
        Listener.bot.api.sendmessage(
          parsemode: 'html',
          chatid: chat,
          text: message
        )
      end
      module_function(
        :std_message
      )
    end
  end
end
