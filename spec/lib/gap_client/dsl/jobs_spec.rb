require 'spec_helper'

RSpec.describe 'GapClient::DSL::Jobs' do
  describe '#get_job' do
    it 'gets a job' do
      VCR.use_cassette('get_job') do
        response = GAP_CLIENT.get_job(id: 4)
        expect(response).to be_a(GapClient::Resources::Job)
      end
    end
  end

  describe '#get_jobs' do
    it 'gets jobs' do
      VCR.use_cassette('get_jobs') do
        response = GAP_CLIENT.get_jobs
        expect(response.data).to be_a(Array)
        expect(response.data.first).to be_a(GapClient::Resources::Job)
      end
    end
  end
end
