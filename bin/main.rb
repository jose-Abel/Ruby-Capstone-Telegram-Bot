#!/usr/bin/env ruby

# rubocop : disable Metrics/BlockLength

# rubocop : disable Layout/LineLength

require 'dotenv'
require 'telegram/bot'
require_relative '../lib/crypto_info'
require_relative '../lib/crypto_news'
Dotenv.load('./.env')

token = ENV['TELEGRAM_TOKEN_KEY']

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'

      text = "Hello, Welcome to the Top 10 crypto currencies chat bot, the place where you'll find the price for top 10 cryptos and the latest news about them. Please choose base on what you'll like to see now. Price choose '/price'. Top news '/topnews'. Top news by coin '/tncbitcoin', '/tncethereum', '/tnctether', '/tncripple', '/tncpolkadot', '/tnccardano, '/tncchainlink', '/tnclitecoin, '/tncbinancecoin', '/tncstellar'"

      bot.api.send_message(chat_id: message.chat.id, text: text, date: message.date)

    when '/price'
      info = CryptoInfo.new
      arr = info.looping_top_10_listings
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/topnews'
      news = CryptoNews.new
      arr = news.get_latest_news
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text, date: message.date)

    when '/tncbitcoin'
      news = CryptoNews.new
      arr = news.get_individual_crypto('BTC')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/tncethereum'
      news = CryptoNews.new
      arr = news.get_individual_crypto('ETH')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/tnctether'
      news = CryptoNews.new
      arr = news.get_individual_crypto('USDT')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/tncripple'
      news = CryptoNews.new
      arr = news.get_individual_crypto('XRP')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/tncpolkadot'
      news = CryptoNews.new
      arr = news.get_individual_crypto('DOT')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/tnccardano'
      news = CryptoNews.new
      arr = news.get_individual_crypto('ADA')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/tncchainlink'
      news = CryptoNews.new
      arr = news.get_individual_crypto('LINK')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)
      
    when '/tnclitecoin'
      news = CryptoNews.new
      arr = news.get_individual_crypto('LTC')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)
      
    when '/tncbinancecoin'
      news = CryptoNews.new
      arr = news.get_individual_crypto('BNB')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/tncstellar'
      news = CryptoNews.new
      arr = news.get_individual_crypto('XLM')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)       
    end
  end
end

# rubocop : enable Metrics/BlockLength

# rubocop : enable Layout/LineLength
