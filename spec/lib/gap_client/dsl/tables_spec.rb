require 'spec_helper'

RSpec.describe 'GapClient::DSL::Tables' do
  describe '#get_table' do
    it 'gets a table' do
      VCR.use_cassette('get_table') do
        quote_response = GAP_CLIENT.get_table(id: 6)
        expect(quote_response).to be_a(GapClient::Resources::Table)
      end
    end
  end

  describe '#get_tables' do
    it 'gets tables' do
      VCR.use_cassette('get_tables') do
        quote_response = GAP_CLIENT.get_tables
        expect(quote_response.data).to be_a(Array)
        expect(quote_response.data.first).to be_a(GapClient::Resources::Table)
      end
    end
  end
end
