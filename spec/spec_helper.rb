require 'bundler/setup'
require 'gap_client'
require 'vcr'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :faraday
end

# GAP client instance used in testing.
# SET THE GAP_API_KEY ENV VAR TO THE GAP API KEY OBTAINED FROM YOUR ACCOUNT.
# https://gap.scienceexchange.com/account

GapClient.api_key = ENV['GAP_API_KEY']
GapClient.url = ENV['GAP_HOST'] || 'https://gap.scienceexchange.com/'
GAP_CLIENT = GapClient.client

