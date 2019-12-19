require 'spec_helper'

RSpec.describe 'GapClient::DSL::Attachments' do
  describe '#get_attachments' do
    it 'gets attachments' do
      VCR.use_cassette('get_attachments') do
        quote_response = GAP_CLIENT.get_attachments
        expect(quote_response).to be_a(Array)
        expect(quote_response).first to_be(GapClient::Resources::Attachment)
      end
    end
  end
end
