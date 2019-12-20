require 'spec_helper'

RSpec.describe 'GapClient::DSL::Lines' do
  describe '#get_line' do
    it 'gets a line' do
      VCR.use_cassette('get_line') do
        quote_response = GAP_CLIENT.get_line(id: 214)
        expect(quote_response).to be_a(GapClient::Resources::Line)
      end
    end
  end

  describe '#get_lines' do
    it 'gets lines' do
      VCR.use_cassette('get_lines') do
        quote_response = GAP_CLIENT.get_lines
        expect(quote_response.data).to be_a(Array)
        expect(quote_response.data.first).to be_a(GapClient::Resources::Line)
      end
    end
  end
end
