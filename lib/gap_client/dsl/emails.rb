require 'gap_client/dsl'

module GapClient
  module DSL::Emails
    # GET /Emails
    # Get emails.
    # @param [Hash] params Parameters for the API end point (optional).
    # @return [Array, nil].
    def get_emails(params: {})
      ::GapClient::Resources::Email.parse(request(:get, 'api/v1/emails/', params))
    end

    # GET /Email/{id}
    # Get a email.
    # @param [String] id A email's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [GapClient::Resources::Email, nil].
    def get_email(id:)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      ::GapClient::Resources::Email.parse(request(:get, "api/v1/emails/#{id}"))
    end
  end
end
