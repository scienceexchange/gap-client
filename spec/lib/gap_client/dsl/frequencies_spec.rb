require 'spec_helper'

RSpec.describe 'GapClient::DSL::Frequencies' do
  describe '#get_frequency' do
    it 'gets a frequency' do
      VCR.use_cassette('get_frequency') do
        quote_response = GAP_CLIENT.get_frequency(id: 189)
        expect(quote_response).to be_a(GapClient::Resources::Frequency)
      end
    end
  end

  describe '#get_frequencies' do
    it 'gets frequencies' do
      VCR.use_cassette('get_frequencies') do
        quote_response = GAP_CLIENT.get_frequencies
        expect(quote_response.data).to be_a(Array)
        expect(quote_response.data.first).to be_a(GapClient::Resources::Frequency)
      end
    end
  end
end
