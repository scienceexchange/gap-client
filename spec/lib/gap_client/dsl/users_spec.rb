require 'spec_helper'

RSpec.describe 'GapClient::DSL::Users' do
  describe '#get_user' do
    it 'gets a user' do
      VCR.use_cassette('get_user') do
        quote_response = GAP_CLIENT.get_user(id: 5)
        expect(quote_response).to be_a(GapClient::Resources::User)
      end
    end
  end

  describe '#get_users' do
    it 'gets users' do
      VCR.use_cassette('get_users') do
        quote_response = GAP_CLIENT.get_users
        expect(quote_response.data).to be_a(Array)
        expect(quote_response.data.first).to be_a(GapClient::Resources::User)
      end
    end
  end
end
