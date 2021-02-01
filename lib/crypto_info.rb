require 'uri'
require 'net/http'
require 'dotenv'
require 'json'

Dotenv.load('./.env')

class CryptoInfo
  attr_reader :url
  attr_writer :url

  def initialize
    @url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?limit=10'
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

  def listings
    latest_listings_hash = get_request
    new_arr = []
    i = 0

    while i < 10
      new_hash = Hash.new(0)

      new_hash[latest_listings_hash['data'][i]['name']] = latest_listings_hash['data'][i]['quote']['USD']['price']

      new_hash["symbol"] = latest_listings_hash['data'][i]['symbol']

      new_arr << new_hash
      i += 1
    end
    new_arr
  end

  def get_request
    uri = URI(url)
    http = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https')
    request = Net::HTTP::Get.new(uri)
    request['Content-Type'] = 'application/json'
    request['X-CMC_PRO_API_KEY'] = "d3dbeff4-2fce-4313-8de9-0985f03079af"

    response = http.request(request)
    result = response.read_body
    my_hash = JSON.parse(result)
    my_hash
  end
end
