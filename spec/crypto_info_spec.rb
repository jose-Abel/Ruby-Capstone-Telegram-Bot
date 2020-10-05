# spec/enumerable_spec.

require_relative '../lib/crypto_info'

describe Crypto_Info do
  describe '#top_10_listings' do
    let(:crypto_info) { Crypto_Info.new }

    it 'Returns an array of hashes' do
      expect(crypto_info.top_10_listings).to be_an Array
    end
  end
end