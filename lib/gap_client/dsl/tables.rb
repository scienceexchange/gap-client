require 'gap_client/dsl'

module GapClient
  module DSL::Tables
    # GET /Tables
    # Get tables.
    # @param [Hash] params Parameters for the API end point (optional).
    # @return [Array, nil].
    def get_tables(params: {})
      ::GapClient::Resources::Table.parse(request(:get, 'api/v1/tables/', params))
    end

    # GET /Table/{id}
    # Get a table.
    # @param [String] id A table's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [GapClient::Resources::Table, nil].
    def get_table(id:)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      ::GapClient::Resources::Table.parse(request(:get, "api/v1/tables/#{id}"))
    end
  end
end
