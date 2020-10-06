# spec/crypto_news_spec

require 'dotenv'
require 'crypto-news-api'
Dotenv.load('./.env')

require_relative '../lib/crypto_news'

describe CryptoNews do
  describe '#api instance variable' do
    it 'Verified that api is of class CryptoControl::QueryAPI' do
      expect(CryptoNews.new.api).to be_an CryptoControl::QueryAPI
    end
  end

  describe '#top_news' do
    let(:api) { CryptoControl::QueryAPI.new(ENV['CRYPTO_NEWS']) }
    let(:crypto_news) { CryptoNews.new }

    it 'Returns a hash or array with the data' do
      expect(api.getTopNews).to be_a Array
    end
  end

  describe '#top_news_by_coin' do
    let(:api) { CryptoControl::QueryAPI.new(ENV['CRYPTO_NEWS']) }

    it 'Returns an array with the data' do
      expect(api.getTopNewsByCoin('bitcoin')).to be_a Array
    end
  end

  describe '#top_tweets_by_coin' do
    let(:api) { CryptoControl::QueryAPI.new(ENV['CRYPTO_NEWS']) }

    it 'Returns an array with the data' do
      expect(api.getTopTweetsByCoin('ethereum')).to be_a Array
    end
  end

  describe '#top_reddits_by_coin' do
    let(:api) { CryptoControl::QueryAPI.new(ENV['CRYPTO_NEWS']) }

    it 'Returns an array with the data' do
      expect(api.getLatestRedditPostsByCoin('ripple')).to be_a Array
    end
  end

  describe '#latest_reddit_tweets_by_coin' do
    let(:api) { CryptoControl::QueryAPI.new(ENV['CRYPTO_NEWS']) }

    it 'Returns a hash with the data' do
      expect(api.getLatestItemsByCoin('tether')).to be_a Hash
    end
  end
end
