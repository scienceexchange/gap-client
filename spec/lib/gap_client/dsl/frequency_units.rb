require 'spec_helper'

RSpec.describe 'GapClient::DSL::FrequencyUnits' do
  describe '#get_frequency_unit' do
    it 'gets a frequency unit' do
      VCR.use_cassette('get_frequency_unit') do
        quote_response = GAP_CLIENT.get_frequency_unit(id: 189)
        expect(quote_response).to be_a(GapClient::Resources::FrequencyUnit)
      end
    end
  end

  describe '#get_frequency_units' do
    it 'gets frequency units' do
      VCR.use_cassette('get_frequency_units') do
        quote_response = GAP_CLIENT.get_frequency_units
        expect(quote_response.data).to be_a(Array)
        expect(quote_response.data.first).to be_a(GapClient::Resources::FrequencyUnit)
      end
    end
  end
end
