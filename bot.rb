require 'telegram/bot'
require 'dotenv/load'
require 'dotenv'
require './library/database'

Telegram::Bot::Client.run(ENV['TOKEN']) do |bot|
  bot.listen do |message|
    p message.text
    case message.text
    when '/start'
      text = "Привет, #{message.from.first_name}.\nЭтот бот поможет тебе распланировать свой день.\nНо для этого потребуется подключить Google Таблицы"
      kb = [
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Авторизаци Google', callback_data: 'ok'),
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Остановить бота', callback_data: '/stop')
      ]
      markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(inline_keyboard: kb)
      bot.api.send_message(chat_id: message.chat.id, text: text, reply_markup: markup)
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end

