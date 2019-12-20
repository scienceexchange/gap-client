require 'gap_client/dsl'

module GapClient
  module DSL::Cells
    # GET /Cells
    # Get cells.
    # @param [Hash] params Parameters for the API end point (optional).
    # @return [Array, nil].
    def get_cells(params: {})
      ::GapClient::Resources::Cell.parse(request(:get, 'api/v1/cells/', params))
    end

    # GET /Cell/{id}
    # Get a cell.
    # @param [String] id A cell's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [GapClient::Resources::Cell, nil].
    def get_cell(id:)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      ::GapClient::Resources::Cell.parse(request(:get, "api/v1/cells/#{id}"))
    end
  end
end
