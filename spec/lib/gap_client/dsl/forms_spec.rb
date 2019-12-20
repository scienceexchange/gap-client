require 'spec_helper'

RSpec.describe 'GapClient::DSL::Forms' do
  describe '#get_form' do
    it 'gets a form' do
      VCR.use_cassette('get_form') do
        quote_response = GAP_CLIENT.get_form(id: 34)
        expect(quote_response).to be_a(GapClient::Resources::Form)
      end
    end
  end

  describe '#get_forms' do
    it 'gets forms' do
      VCR.use_cassette('get_forms') do
        quote_response = GAP_CLIENT.get_forms
        expect(quote_response.data).to be_a(Array)
        expect(quote_response.data.first).to be_a(GapClient::Resources::Form)
      end
    end
  end
end
