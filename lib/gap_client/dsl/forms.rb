require 'gap_client/dsl'

module GapClient
  module DSL::Forms
    # GET /Forms
    # Get forms.
    # @param [Hash] params Parameters for the API end point (optional).
    # @return [Array, nil].
    def get_forms(params: {})
      ::GapClient::Resources::Form.parse(request(:get, 'api/v1/forms/', params))
    end

    # GET /Form/{id}
    # Get a form.
    # @param [String] id A form's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [GapClient::Resources::Form, nil].
    def get_form(id:)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      ::GapClient::Resources::Form.parse(request(:get, "api/v1/forms/#{id}"))
    end
  end
end
