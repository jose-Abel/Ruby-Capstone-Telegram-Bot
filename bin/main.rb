#!/usr/bin/env ruby
require 'dotenv'
require 'telegram/bot'
Dotenv.load('./.env')

token = ENV['TELEGRAM_TOKEN_KEY']

# def top_10_listings
#   info = Crypto_Info.new
#   latest_listings_hash = info.latest_listings
#   i = 0
#   while i < 10
#     puts latest_listings_hash["data"][i]['name']
#     puts latest_listings_hash["data"][i]["quote"]["USD"]["price"]
#     i += 1
#   end
# end


Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    text = ["😜", "😂", "🥺"].sample
    bot.api.send_message(chat_id: message.chat.id, text: text)
  end
end