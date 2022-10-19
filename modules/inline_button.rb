class BotSocket
  # This module assigned to creating InlineKeyboardButton
  module Inline_Button
    GET_ACCOUNT = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Получить account', callback_data: 'get_account')
   end
end
