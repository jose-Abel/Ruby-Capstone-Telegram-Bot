require 'uri'
require 'net/http'
require 'dotenv'
require 'json'

Dotenv.load('./.env')

class CryptoInfo
  attr_reader :url
  attr_writer :url

  require JSON

  def initialize
    @url = 'https://pro-api.coinmarketcap.com'
  end

  def looping_top_10_listings
    i = 0
    new_arr = []
    data = top_10_listings
    while i < 10
      new_arr << "Crypto Currency : #{data[i]['name']}"
      new_arr << "Exchange Rate Dollar based : #{data[i]['price']}"
      i += 1
    end
    new_arr
  end

  private

  def top_10_listings
    latest_listings_hash = latest_listings
    new_arr = []
    i = 0

    while i < 10
      new_hash = Hash.new(0)
      new_hash['name'] = latest_listings_hash['data'][i]['name']
      new_hash['price'] = latest_listings_hash['data'][i]['quote']['USD']['price']
      new_arr << new_hash
      i += 1
    end
    new_arr
  end

  def latest_listings
    endpoint = '/v1/cryptocurrency/listings/latest?limit=10'
    result = get_request(endpoint)
    my_hash = JSON.parse(result)
    my_hash
  end

  def get_request(endpoint)
    url_endpoint = url << endpoint
    uri = URI(url_endpoint)
    http = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https')
    request = Net::HTTP::Get.new(uri)
    request['Content-Type'] = 'application/json'
    request['X-CMC_PRO_API_KEY'] = ENV['COINMARKETCAP_API']

    response = http.request(request)
    result = response.read_body
    result
  end
end
