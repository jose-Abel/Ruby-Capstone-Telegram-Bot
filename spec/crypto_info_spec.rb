# spec/crypto_info_spec

require_relative '../lib/crypto_info'

describe CryptoInfo do
  describe '#url instance variable' do
    it 'Assigns the instance variable url to API url' do
      expect(CryptoInfo.new.url).to match 'https://pro-api.coinmarketcap.com'
    end
  end

  describe '#get_request' do
    let(:crypto_info) { CryptoInfo.new }
    let(:endpoint) { '/v1/cryptocurrency/listings/latest?limit=10' }

    it 'Makes the API connection and returns a String' do
      result = crypto_info.send(:get_request, endpoint)
      expect(result).to be_an String
    end
  end
end
