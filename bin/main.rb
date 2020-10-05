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

      text = "Hello, Welcome to the Top 10 crypto currencies chat bot, the place where you'll find the price for top 10 cryptos and the latest news about them. Please choose base on what you'll like to see now. Price choose '/price'. Top news '/topnews'. Top news by coin '/tncbitcoin', '/tncethereum', '/tnctether', '/tncripple'. Top tweets by coin '/ttcbitcoin', '/ttcethereum', '/ttctether', '/ttcripple'. Top reddits posts by coin '/trcbitcoin', '/trcethereum', 'trctether', '/trcripple'. Latests reddits post and tweets by coin '/ltrcbitcoin', '/ltrcethereum', '/ltrctether', '/ltrcripple'."

      bot.api.send_message(chat_id: message.chat.id, text: text, date: message.date)

    when '/price'
      info = CryptoInfo.new
      text = info.top_10_listings
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/topnews'
      news = CryptoNews.new
      text = news.top_news
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/tncbitcoin'
      news = CryptoNews.new
      text = news.top_news_by_coin('bitcoin')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/tncethereum'
      news = CryptoNews.new
      text = news.top_news_by_coin('ethereum')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/tnctether'
      news = CryptoNews.new
      text = news.top_news_by_coin('tether')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/tncripple'
      news = CryptoNews.new
      text = news.top_news_by_coin('ripple')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/ttcbitcoin'
      news = CryptoNews.new
      text = news.top_tweets_by_coin('bitcoin')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/ttcethereum'
      news = CryptoNews.new
      text = news.top_tweets_by_coin('ethereum')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/ttctether'
      news = CryptoNews.new
      text = news.top_tweets_by_coin('tether')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/ttcripple'
      news = CryptoNews.new
      text = news.top_tweets_by_coin('ripple')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/trcbitcoin'
      news = CryptoNews.new
      text = news.top_reddits_by_coin('bitcoin')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/trcethereum'
      news = CryptoNews.new
      text = news.top_reddits_by_coin('ethereum')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/trctether'
      news = CryptoNews.new
      text = news.top_reddits_by_coin('tether')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/trcripple'
      news = CryptoNews.new
      text = news.top_reddits_by_coin('ripple')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/ltrcbitcoin'
      news = CryptoNews.new
      text = news.latest_reddit_tweets_by_coin('bitcoin')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/ltrcethereum'
      news = CryptoNews.new
      text = news.latest_reddit_tweets_by_coin('ethereum')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/ltrctether'
      news = CryptoNews.new
      text = news.latest_reddit_tweets_by_coin('tether')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/ltrcripple'
      news = CryptoNews.new
      text = news.latest_reddit_tweets_by_coin('ripple')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)
    end
  end
end

# rubocop : enable Metrics/BlockLength

# rubocop : enable Layout/LineLength
