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

      text = "Hello, Welcome to the Top 10 crypto currencies chat bot, the place where you'll find the price for top 10 cryptos and the latest news about them. Please choose base on what you'll like to see now. Price choose '/price'. Top news '/topnews'. Top news by coin '/tncbitcoin', '/tncethereum', '/tnctether', '/tncripple'. Top tweets by coin '/ttcbitcoin', '/ttcethereum', '/ttctether', '/ttcripple'. Top reddits posts by coin '/trcbitcoin', '/trcethereum', '/trcbinancecoin', '/trcripple'."

      bot.api.send_message(chat_id: message.chat.id, text: text, date: message.date)

    when '/price'
      info = CryptoInfo.new
      text = info.top_10_listings
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/topnews'
      news = CryptoNews.new
      arr = news.looping_on_news
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text, date: message.date)

    when '/tncbitcoin'
      news = CryptoNews.new
      arr = news.looping_top_news_by_coin('bitcoin')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/tncethereum'
      news = CryptoNews.new
      arr = news.looping_top_news_by_coin('ethereum')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/tnctether'
      news = CryptoNews.new
      arr = news.looping_top_news_by_coin('tether')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/tncripple'
      news = CryptoNews.new
      arr = news.looping_top_news_by_coin('ripple')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/ttcbitcoin'
      news = CryptoNews.new
      arr = news.looping_top_tweets_by_coin('bitcoin')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/ttcethereum'
      news = CryptoNews.new
      arr = news.looping_top_tweets_by_coin('ethereum')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/ttctether'
      news = CryptoNews.new
      arr = news.looping_top_tweets_by_coin('tether')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/ttcripple'
      news = CryptoNews.new
      arr = news.looping_top_tweets_by_coin('ripple')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/trcbitcoin'
      news = CryptoNews.new
      arr = news.looping_top_reddits_by_coin('bitcoin')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/trcethereum'
      news = CryptoNews.new
      arr = news.looping_top_reddits_by_coin('ethereum')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/trcbinancecoin'
      news = CryptoNews.new
      arr = news.looping_top_reddits_by_coin('binance-coin')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/trcripple'
      news = CryptoNews.new
      arr = news.looping_top_reddits_by_coin('ripple')
      text = arr.map(&:inspect).join(', ')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)
    end
  end
end

# rubocop : enable Metrics/BlockLength

# rubocop : enable Layout/LineLength
