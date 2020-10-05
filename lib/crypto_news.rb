require 'dotenv'
require 'crypto-news-api'
Dotenv.load('./.env')

class CryptoNews
  attr_reader :api

  def initialize
    @api = CryptoControl::QueryAPI.new(ENV['CRYPTO_NEWS'])
  end

  def top_news
    result_hash = api.getTopNews
    top_5(result_hash)
  end

  def top_news_by_coin(coin)
    result_hash = api.getTopNewsByCoin coin.to_s
    top_5(result_hash)
  end

  def top_tweets_by_coin(coin)
    result_hash = api.getTopTweetsByCoin coin.to_s
    new_arr = []
    counter = 0

    while counter < 5
      new_hash = Hash.new(0)
      new_hash['retweet_count'] = result_hash[counter]['retweetCount']
      new_hash['favorite_count'] = result_hash[counter]['favoriteCount']
      new_hash['text'] = result_hash[counter]['text']
      new_hash['username'] = result_hash[counter]['username']
      new_hash['date published'] = result_hash[counter]['publishedAt']
      new_hash['url'] = result_hash[counter]['url']

      new_arr << new_hash
      counter += 1
    end
    new_arr
  end

  def top_reddits_by_coin(coin)
    result_hash = api.getLatestRedditPostsByCoin coin.to_s
    new_arr = []
    counter = 0

    while counter < 5
      new_hash = Hash.new(0)
      new_hash['comments'] = result_hash[counter]['comments']
      new_hash['downvotes'] = result_hash[counter]['downvotes']
      new_hash['upvotes'] = result_hash[counter]['upvotes']
      new_hash['title'] = result_hash[counter]['title']
      new_hash['description'] = result_hash[counter]['description']
      new_hash['date published'] = result_hash[counter]['publishedAt']
      new_hash['url'] = result_hash[counter]['url']

      new_arr << new_hash
      counter += 1
    end
    new_arr
  end

  def latest_reddit_tweets_by_coin(coin)
    result_hash = api.getLatestItemsByCoin coin.to_s
    new_arr = []
    counter = 0

    while counter < 5
      new_hash = Hash.new(0)
      new_hash['title'] = result_hash['articles'][counter]['title']
      new_hash['description'] = result_hash['articles'][counter]['description']
      new_hash['url'] = result_hash['articles'][counter]['url']
      new_arr << new_hash
      counter += 1
    end
    new_arr
  end

  private

  def top_5(data)
    counter = 0
    new_arr = []
    new_hash = Hash.new(0)

    while counter < 5
      new_hash['title'] = data[counter]['title']
      new_hash['description'] = data[counter]['description']
      new_hash['published date'] = data[counter]['publishedAt']
      new_hash['source domain'] = data[counter]['sourceDomain']
      new_hash['url'] = data[counter]['url']
      new_arr << new_hash
      counter += 1
    end
    new_arr
  end
end
