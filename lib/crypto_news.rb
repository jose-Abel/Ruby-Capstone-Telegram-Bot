require 'dotenv'
require 'net/http'
require 'json'
Dotenv.load('./.env')

class CryptoNews
  attr_reader :api
  attr_reader :url

  def initialize
    @api = ENV['CRYPTO_NEWS']
    @url = "https://cryptopanic.com/api/v1/posts/?auth_token=#{api}"
  end

  def get_latest_news
    latest_news = get_request(url)

    i = 0
    array_of_hashes = []
    while i < 10
      new_hash = Hash.new(0)

      new_hash["domain"] = latest_news["results"][i]["domain"]

      new_hash["title"] = latest_news["results"][i]["title"]

      new_hash["url"] = latest_news["results"][i]["url"]
      
      array_of_hashes << new_hash
      i += 1
    end

    y = 0
    new_arr = []
    while y < 10
      new_arr << "Title : #{array_of_hashes[y]['title']}"
      new_arr << "Domain : #{array_of_hashes[y]['domain']}"
      new_arr << "Url : #{array_of_hashes[y]['url']}"

      y += 1
    end
    return new_arr
  end
  
  def get_individual_crypto(ticker)
    currency = get_request(url + "&currencies=#{ticker}")

    i = 0
    array_of_hashes = []
    while i < 10
      new_hash = Hash.new(0)

      new_hash["domain"] = currency["results"][i]["domain"]

      new_hash["title"] = currency["results"][i]["title"]

      new_hash["url"] = currency["results"][i]["url"]
      
      array_of_hashes << new_hash
      i += 1
    end
    
    y = 0
    new_arr = []
    while y < 10
      new_arr << "Number : #{y + 1}"
      new_arr << "Title : #{array_of_hashes[y]['title']}"
      new_arr << "Domain : #{array_of_hashes[y]['domain']}"
      new_arr << "Url : #{array_of_hashes[y]['url']}"

      y += 1
    end

    new_arr
  end

  def get_request(url)
    uri = URI(url)
    http = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https')
    request = Net::HTTP::Get.new(uri)
    response = http.request(request)
    result = response.read_body
    my_hash = JSON.parse(result)
    my_hash
  end
end

# cyptonews = CryptoNews.new

# puts cyptonews.get_latest_news()

# puts cyptonews.get_individual_crypto("BTC")


