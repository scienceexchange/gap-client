require "gap_client/version"

module GapClient
  autoload :Client, 'gap_client/client'
  autoload :DSL, 'gap_client/dsl'
  autoload :Resources, 'gap_client/resources'
  autoload :Errors, 'gap_client/errors'
  autoload :Utils, 'gap_client/utils'

  class << self
    attr_accessor :api_key
    attr_accessor :url
    attr_accessor :logger
  end

  module_function

  # @return [GapClient::Client]
  def client
    @client ||= Client.new(GapClient.api_key, GapClient.url)
  end
end
