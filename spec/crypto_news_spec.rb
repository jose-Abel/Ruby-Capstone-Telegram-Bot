# spec/enumerable_spec.

require_relative '../lib/crypto_news'

describe Crypto_News do
  describe '#top_10_listings' do
    let(:crypto_news) { Crypto_News.new }

    it 'Returns an array of hashes' do
      expect(crypto_news.top_news).to be_an Array
    end

    # it 'Should have a key named title' do
    #   expect(crypto_news.top_news).to have_key(:title)
    # end
    
    it 'Should have a key named title' do
      crypto_news.top_news.each do |hash|
        expect(hash.keys).to contain_exactly("title")
      end
    end

    it 'Should received an argument of type String' do
      crypto_news.top_news.should_receive(:crypto_news.top_news) do |arg|
        arg.should be_a String
      end
    end
    
  end

  describe '#top_news_by_coin' do
    let(:crypto_news) { Crypto_News.new }

    it 'Returns an array of hashes' do
      expect(crypto_news.top_news_by_coin("bitcoin")).to be_an Array
    end
  end

  describe '#top_tweets_by_coin' do
    let(:crypto_news) { Crypto_News.new }

    it 'Returns an array of hashes' do
      expect(crypto_news.top_tweets_by_coin("tether")).to be_an Array
    end
  end

  describe '#top_reddits_by_coin' do
    let(:crypto_news) { Crypto_News.new }

    it 'Returns an array of hashes' do
      expect(crypto_news.top_reddits_by_coin("ripple")).to be_an Array
    end
  end

  describe '#latest_reddit_tweets_by_coin' do
    let(:crypto_news) { Crypto_News.new }

    it 'Returns an array of hashes' do
      expect(crypto_news.latest_reddit_tweets_by_coin("ethereum")).to be_an Array
    end
  end
  
end