require 'gap_client/dsl'

module GapClient
  module DSL::Lines
    # GET /Lines
    # Get lines.
    # @param [Hash] params Parameters for the API end point (optional).
    # @return [Array, nil].
    def get_lines(params: {})
      ::GapClient::Resources::Line.parse(request(:get, 'api/v1/lines/', params))
    end

    # GET /Line/{id}
    # Get a line.
    # @param [String] id A line's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [GapClient::Resources::Line, nil].
    def get_line(id:)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      ::GapClient::Resources::Line.parse(request(:get, "api/v1/lines/#{id}"))
    end
  end
end
