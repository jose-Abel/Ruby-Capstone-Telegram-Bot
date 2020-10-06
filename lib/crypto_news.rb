require 'dotenv'
require 'crypto-news-api'
Dotenv.load('./.env')

class CryptoNews
  attr_reader :api

  def initialize
    @api = CryptoControl::QueryAPI.new(ENV['CRYPTO_NEWS'])
  end

  def looping_on_news
    i = 0
    new_arr = []
    while i < 5
      new_arr << "Title : #{top_news[i]['title']}"
      new_arr << "Description : #{top_news[i]['description']}"
      new_arr << "Published Date : #{top_news[i]['published date']}"
      new_arr << "Url : #{top_news[i]['url']}"
      i += 1
    end
    new_arr
  end

  def looping_top_news_by_coin(coin)
    i = 0
    new_arr = []

    while i < 5
      new_arr << "Title : #{top_news_by_coin(coin)[i]['title']}"
      new_arr << "Description : #{top_news_by_coin(coin)[i]['description']}"
      new_arr << "Published Date : #{top_news_by_coin(coin)[i]['published date']}"
      new_arr << "Url : #{top_news_by_coin(coin)[i]['url']}"
      i += 1
    end
    new_arr
  end

  def looping_top_tweets_by_coin(coin)
    news = CryptoNews.new
    i = 0
    new_arr = []
    while i < 5
      new_arr << "Text : #{top_tweets_by_coin(coin)[i]['text']}"
      new_arr << "Retweets Count : #{top_tweets_by_coin(coin)[i]['retweets']}"
      new_arr << "Username : #{top_tweets_by_coin(coin)[i]['username']}"
      new_arr << "Published Date : #{top_tweets_by_coin(coin)[i]['published date']}"
      new_arr << "Url : #{top_tweets_by_coin(coin)[i]['url']}"
      i += 1
    end
    new_arr
  end

  def looping_top_reddits_by_coin(coin)
    i = 0
    new_arr = []

    while i < 5
      new_arr << "Title #{i + 1} : #{top_reddits_by_coin(coin)[i]['title']}"
      new_arr << "Description : #{top_reddits_by_coin(coin)[i]['description']}"
      new_arr << "Date published : #{top_reddits_by_coin(coin)[i]['date published']}"
      new_arr << "url : #{top_reddits_by_coin(coin)[i]['url']}"
      new_arr << "Comments : #{top_reddits_by_coin(coin)[i]['comments']}"
      new_arr << "Upvotes : #{top_reddits_by_coin(coin)[i]['upvotes']}"
      new_arr << "Downvotes : #{top_reddits_by_coin(coin)[i]['downvotes']}"

      i += 1
    end
    new_arr
  end

  private

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
      new_hash['text'] = result_hash[counter]['text']
      new_hash['retweets'] = result_hash[counter]['retweetCount']
      new_hash['username'] = result_hash[counter]['username']
      new_hash['published date'] = result_hash[counter]['publishedAt']
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
      new_hash['title'] = result_hash[counter]['title']
      new_hash['comments'] = result_hash[counter]['comments']
      new_hash['downvotes'] = result_hash[counter]['downvotes']
      new_hash['upvotes'] = result_hash[counter]['upvotes']
      new_hash['description'] = result_hash[counter]['description']
      new_hash['date published'] = result_hash[counter]['publishedAt']
      new_hash['url'] = result_hash[counter]['url']
      new_arr << new_hash
      counter += 1
    end
    new_arr
  end

  def top_5(data)
    counter = 0
    new_arr = []

    while counter < 5
      new_hash = Hash.new(0)
      new_hash['title'] = data[counter]['title']
      new_hash['description'] = data[counter]['description']
      new_hash['published date'] = data[counter]['publishedAt']
      new_hash['url'] = data[counter]['url']
      new_arr << new_hash
      counter += 1
    end
    new_arr
  end
end

# api = CryptoControl::QueryAPI.new(ENV['CRYPTO_NEWS'])

# puts api.getLatestRedditPostsByCoin("binance-coin")

# news = CryptoNews.new
# puts news.looping_top_reddits_by_coin("tether")
