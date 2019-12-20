require 'spec_helper'

RSpec.describe 'GapClient::DSL::Runs' do
  describe '#get_run' do
    it 'gets a run' do
      VCR.use_cassette('get_run') do
        quote_response = GAP_CLIENT.get_run(id: 189)
        expect(quote_response).to be_a(GapClient::Resources::Run)
      end
    end
  end

  describe '#get_runs' do
    it 'gets runs' do
      VCR.use_cassette('get_runs') do
        quote_response = GAP_CLIENT.get_runs
        expect(quote_response.data).to be_a(Array)
        expect(quote_response.data.first).to be_a(GapClient::Resources::Run)
      end
    end
  end
end
