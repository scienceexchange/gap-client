require 'spec_helper'

RSpec.describe 'GapClient::DSL::Attachments' do
  describe '#get_attachment' do
    it 'gets an attachment' do
      VCR.use_cassette('get_attachment') do
        response = GAP_CLIENT.get_attachment(id: 189)
        expect(response).to be_a(GapClient::Resources::Attachment)
      end
    end
  end

  describe '#get_attachments' do
    it 'gets attachments' do
      VCR.use_cassette('get_attachments') do
        response = GAP_CLIENT.get_attachments
        expect(response.data).to be_a(Array)
        expect(response.data.first).to be_a(GapClient::Resources::Attachment)
      end
    end
  end

  describe '#get_attachment_email' do
    it 'gets an attachments email' do
      VCR.use_cassette('get_attachment_email') do
        response = GAP_CLIENT.get_attachment_email(id: 189)
        expect(response).to be_a(GapClient::Resources::Email)
      end
    end
  end
end
