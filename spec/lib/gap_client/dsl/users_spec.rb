require 'spec_helper'

RSpec.describe 'GapClient::DSL::Users' do
  describe '#get_user' do
    it 'gets a user' do
      VCR.use_cassette('get_user') do
        response = GAP_CLIENT.get_user(id: 7)
        expect(response).to be_a(GapClient::Resources::User)
      end
    end
  end

  describe '#get_users' do
    it 'gets users' do
      VCR.use_cassette('get_users') do
        response = GAP_CLIENT.get_users
        expect(response.data).to be_a(Array)
        expect(response.data.first).to be_a(GapClient::Resources::User)
      end
    end
  end
end
