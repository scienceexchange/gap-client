require 'spec_helper'

RSpec.describe 'GapClient::DSL::Emails' do
  describe '#get_email' do
    it 'gets an email' do
      VCR.use_cassette('get_email') do
        quote_response = GAP_CLIENT.get_email(id: 189)
        expect(quote_response).to be_a(GapClient::Resources::Email)
      end
    end
  end

  describe '#get_emails' do
    it 'gets emails' do
      VCR.use_cassette('get_emails') do
        quote_response = GAP_CLIENT.get_emails
        expect(quote_response.data).to be_a(Array)
        expect(quote_response.data.first).to be_a(GapClient::Resources::Email)
      end
    end
  end
end
