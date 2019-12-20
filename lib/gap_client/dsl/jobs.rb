require 'gap_client/dsl'

module GapClient
  module DSL::Jobs
    # GET /Jobs
    # Get jobs.
    # @param [Hash] params Parameters for the API end point (optional).
    # @return [Array, nil].
    def get_jobs(params: {})
      ::GapClient::Resources::Job.parse(request(:get, 'api/v1/jobs/', params))
    end

    # GET /Job/{id}
    # Get a job.
    # @param [String] id A job's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [GapClient::Resources::Job, nil].
    def get_job(id:)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      ::GapClient::Resources::Job.parse(request(:get, "api/v1/jobs/#{id}"))
    end
  end
end
