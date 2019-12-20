require 'gap_client/dsl'

module GapClient
  module DSL::FrequencyUnits
    # GET /FrequencyUnits
    # Get frequency units.
    # @param [Hash] params Parameters for the API end point (optional).
    # @return [Array, nil].
    def get_frequency_unitss(params: {})
      ::GapClient::Resources::FrequencyUnit.parse(request(:get, 'api/v1/frequency_units/', params))
    end

    # GET /FrequencyUnit/{id}
    # Get a frequency unit.
    # @param [String] id A frequency units ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [GapClient::Resources::FrequencyUnit, nil].
    def get_frequency_units(id:)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      ::GapClient::Resources::FrequencyUnit.parse(request(:get, "api/v1/frequency_units/#{id}"))
    end
  end
end
