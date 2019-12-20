require 'gap_client/dsl'

module GapClient
  module DSL::Words
    # GET /Words
    # Get words.
    # @param [Hash] params Parameters for the API end point (optional).
    # @return [Array, nil].
    def get_words(params: {})
      ::GapClient::Resources::Word.parse(request(:get, 'api/v1/words/', params))
    end

    # GET /Word/{id}
    # Get a word.
    # @param [String] id A word's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [GapClient::Resources::Word, nil].
    def get_word(id:)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      ::GapClient::Resources::Word.parse(request(:get, "api/v1/words/#{id}"))
    end
  end
end
