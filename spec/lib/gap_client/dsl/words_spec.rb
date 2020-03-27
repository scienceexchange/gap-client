require 'spec_helper'

RSpec.describe 'GapClient::DSL::Words' do
  describe '#get_word' do
    it 'gets a word' do
      VCR.use_cassette('get_word') do
        response = GAP_CLIENT.get_word(id: 577)
        expect(response).to be_a(GapClient::Resources::Word)
      end
    end
  end

  describe '#get_words' do
    it 'gets words' do
      VCR.use_cassette('get_words') do
        response = GAP_CLIENT.get_words
        expect(response.data).to be_a(Array)
        expect(response.data.first).to be_a(GapClient::Resources::Word)
      end
    end
  end
end
