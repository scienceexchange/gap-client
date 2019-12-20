require 'gap_client/dsl'

module GapClient
  module DSL::Frequencies
    # GET /Frequencies
    # Get frequencies.
    # @param [Hash] params Parameters for the API end point (optional).
    # @return [Array, nil].
    def get_frequencies(params: {})
      ::GapClient::Resources::Frequency.parse(request(:get, 'api/v1/frequencies/', params))
    end

    # GET /Frequency/{id}
    # Get a frequency.
    # @param [String] id A frequency's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [GapClient::Resources::Frequency, nil].
    def get_frequency(id:)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      ::GapClient::Resources::Frequency.parse(request(:get, "api/v1/frequencies/#{id}"))
    end
  end
end
