require 'gap_client/dsl'

module GapClient
  module DSL::Runs
    # GET /Runs
    # Get runs.
    # @param [Hash] params Parameters for the API end point (optional).
    # @return [Array, nil].
    def get_runs(params: {})
      ::GapClient::Resources::Run.parse(request(:get, 'api/v1/runs/', params))
    end

    # GET /Run/{id}
    # Get a run.
    # @param [String] id A run's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [GapClient::Resources::Run, nil].
    def get_run(id:)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      ::GapClient::Resources::Run.parse(request(:get, "api/v1/runs/#{id}"))
    end
  end
end
