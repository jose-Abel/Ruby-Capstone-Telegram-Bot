#!/usr/bin/env ruby

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

      text = "Hello, Welcome to the Top 10 crypto currencies chat bot, the place where you'll find the price for top 10 cryptos and the latest news about them. Please choose base on what you'll like to see now. Price choose '/p'. Top news type '/tnbitcoin', '/tnethereum', '/tntether', '/tnripple'. Top news by coin type '/tncbitcoin', '/tncethereum', '/tnctether', '/tncripple'. Top tweets by coin type '/ttcbitcoin', '/ttcethereum', '/ttctether', '/ttcripple'. Top reddits posts by coin type '/tncbitcoin', '/tncethereum', 'tnctether', '/tncripple'. Latests reddits post and tweets by coin type '/ltrcbitcoin', '/ltrcethereum', '/ltrctether', '/ltrcripple'."

      bot.api.send_message(chat_id: message.chat.id, text: text, date: message.date)
    
    when '/p'
      info = Crypto_Info.new
      text = info.top_10_listings
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when '/tn'
      news = Crypto_News.new
      text = news.top_news
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when "/tncbitcoin"
      news = Crypto_News.new
      text = news.top_news_by_coin('bitcoin')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when "/tncethereum"
      news = Crypto_News.new
      text = news.top_news_by_coin('ethereum')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when "/tnctether"
      news = Crypto_News.new
      text = news.top_news_by_coin('tether')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when "/tncripple"
      news = Crypto_News.new
      text = news.top_news_by_coin('ripple')
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)
    
    when "/ttcbitcoin"
      news = Crypto_News.new
      text = news.top_tweets_by_coin("bitcoin")
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when "/ttcethereum"
      news = Crypto_News.new
      text = news.top_tweets_by_coin("ethereum")
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when "/ttctether"
      news = Crypto_News.new
      text = news.top_tweets_by_coin("tether")
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when "/ttcripple"
      news = Crypto_News.new
      text = news.top_tweets_by_coin("ripple")
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when "/trcbitcoin"
      news = Crypto_News.new
      text = news.top_reddits_by_coin("bitcoin")
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when "/trcethereum"
      news = Crypto_News.new
      text = news.top_reddits_by_coin("ethereum")
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when "/trctether"
      news = Crypto_News.new
      text = news.top_reddits_by_coin("tether")
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when "/trcripple"
      news = Crypto_News.new
      text = news.top_reddits_by_coin("ripple")
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when "/ltrcbitcoin"
      news = Crypto_News.new
      text = news.latest_reddit_tweets_by_coin("bitcoin")
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when "/ltrcethereum"
      news = Crypto_News.new
      text = news.latest_reddit_tweets_by_coin("ethereum")
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when "/ltrctether"
      news = Crypto_News.new
      text = news.latest_reddit_tweets_by_coin("tether")
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)

    when "/ltrcripple"
      news = Crypto_News.new
      text = news.latest_reddit_tweets_by_coin("ripple")
      bot.api.send_message(chat_id: message.chat.id, text: text.to_s, date: message.date)
    end
  end
end