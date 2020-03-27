require 'spec_helper'

RSpec.describe 'GapClient::DSL::Cells' do
  describe '#get_cell' do
    it 'gets a cell' do
      VCR.use_cassette('get_cell') do
        response = GAP_CLIENT.get_cell(id: 177)
        expect(response).to be_a(GapClient::Resources::Cell)
      end
    end
  end

  describe '#get_cells' do
    it 'gets cells' do
      VCR.use_cassette('get_cells') do
        response = GAP_CLIENT.get_cells
        expect(response.data).to be_a(Array)
        expect(response.data.first).to be_a(GapClient::Resources::Cell)
      end
    end
  end
end
