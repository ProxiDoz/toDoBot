class FishSocket
  module Listener
    # This module assigned to processing all standart messages
    module StandartMessages
      def process
        case Listener.message.text
        when '/get_account'
          Response.std_message 'Very sorry, нету аккаунтов на данный момент'
        else
          Response.std_message 'Первый раз такое слышу, попробуй другой текст'
        end
      end
      module_function(
          :process
      )
    end
  end
end
