require 'gap_client/dsl'

module GapClient
  module DSL::Users
    # GET /Users
    # Get users.
    # @param [Hash] params Parameters for the API end point (optional).
    # @return [Array, nil].
    def get_users(params: {})
      ::GapClient::Resources::User.parse(request(:get, 'api/v1/users/', params))
    end

    # GET /User/{id}
    # Get a user.
    # @param [String] id A user's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [GapClient::Resources::user, nil].
    def get_user(id:)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      ::GapClient::Resources::User.parse(request(:get, "api/v1/users/#{id}"))
    end
  end
end
