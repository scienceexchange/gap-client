require 'gap_client/dsl'

module GapClient
  module DSL::Attachments
    # GET /Attachments
    # Get attachments.
    # @param [Hash] params Parameters for the API end point (optional).
    # @return [Array, nil].
    def get_attachments(params: {})
      ::GapClient::Resources::Attachment.parse(request(:get, 'api/v1/attachments/', params))
    end

    # GET /Attachment/{id}
    # Get a attachment.
    # @param [String] id A attachment's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [GapClient::Resources::Attachment, nil].
    def get_attachment(id:)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      ::GapClient::Resources::Attachment.parse(request(:get, "api/v1/attachments/#{id}"))
    end
  end
end
