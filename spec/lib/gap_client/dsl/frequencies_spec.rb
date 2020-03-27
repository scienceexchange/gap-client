require 'spec_helper'

RSpec.describe 'GapClient::DSL::Frequencies' do
  describe '#get_frequency' do
    it 'gets a frequency' do
      VCR.use_cassette('get_frequency') do
        response = GAP_CLIENT.get_frequency(id: 1)
        expect(response).to be_a(GapClient::Resources::Frequency)
      end
    end
  end

  describe '#get_frequencies' do
    it 'gets frequencies' do
      VCR.use_cassette('get_frequencies') do
        response = GAP_CLIENT.get_frequencies
        expect(response.data).to be_a(Array)
        expect(response.data.first).to be_a(GapClient::Resources::Frequency)
      end
    end
  end
end
