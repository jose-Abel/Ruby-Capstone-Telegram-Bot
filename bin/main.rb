#!/usr/bin/env ruby
require 'dotenv'
require 'telegram/bot'
Dotenv.load('./.env')

token = ENV['TELEGRAM_TOKEN_KEY']

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    text = ["😜", "😂", "🥺"].sample
    bot.api.send_message(chat_id: message.chat.id, text: text)
  end
end