require 'uri'
require 'net/http'
require 'dotenv'
require "json"

Dotenv.load('./.env')

require JSON

class Crypto_Info
  attr_reader :url
  attr_writer :url

  def initialize
    @url = "https://pro-api.coinmarketcap.com"
  end

  def latest_listings
    endpoint = "/v1/cryptocurrency/listings/latest?limit=10"
    result = get_request(endpoint)
    my_hash = JSON.parse(result)
    my_hash
  end

  private

  def get_request(endpoint)
    url_endpoint = url << endpoint
    uri = URI(url_endpoint)
    http = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https')
    request = Net::HTTP::Get.new(uri)
    request["Content-Type"] = 'application/json'
    request["X-CMC_PRO_API_KEY"] = ENV['COINMARKETCAP_API']

    response = http.request(request)
    result = response.read_body
    result
  end

end