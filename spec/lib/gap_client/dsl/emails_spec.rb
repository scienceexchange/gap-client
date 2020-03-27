require 'spec_helper'

RSpec.describe 'GapClient::DSL::Emails' do
  describe '#get_email' do
    it 'gets an email' do
      VCR.use_cassette('get_email') do
        response = GAP_CLIENT.get_email(id: 189)
        expect(response).to be_a(GapClient::Resources::Email)
      end
    end
  end

  describe '#get_emails' do
    it 'gets emails' do
      VCR.use_cassette('get_emails') do
        response = GAP_CLIENT.get_emails
        expect(response.data).to be_a(Array)
        expect(response.data.first).to be_a(GapClient::Resources::Email)
      end
    end
  end
end
