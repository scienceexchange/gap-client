require 'spec_helper'

RSpec.describe 'GapClient::DSL::Cells' do
  describe '#get_cell' do
    it 'gets a cell' do
      VCR.use_cassette('get_cell') do
        quote_response = GAP_CLIENT.get_cell(id: 177)
        expect(quote_response).to be_a(GapClient::Resources::Cell)
      end
    end
  end

  describe '#get_cells' do
    it 'gets cells' do
      VCR.use_cassette('get_cells') do
        quote_response = GAP_CLIENT.get_cells
        expect(quote_response.data).to be_a(Array)
        expect(quote_response.data.first).to be_a(GapClient::Resources::Cell)
      end
    end
  end
end
