require 'faraday'
require 'json'
require 'openssl'
require 'active_support/all'
require 'gap_client/dsl'
require 'gap_client/errors'
require 'gap_client/utils'

module GapClient
  class Client
    include DSL
    include Errors
    include Utils

    REQUESTS = [:get, :post, :put, :patch, :delete]
    HEADERS = {'Accept' => 'application/vnd.api+json', 'Content-Type' => 'application/vnd.api+json'}

    def initialize(api_key = GapClient.api_key, url = GapClient.url)
      @api_key = api_key
      @url = url

      # Setup HTTP request connection to Science Exchange.
      @connection ||= Faraday.new do |builder|
        builder.request :multipart
        builder.request :url_encoded
        builder.response :logger
        builder.adapter Faraday.default_adapter
      end
    end

    # @param [:get, :post, :put, :patch, :delete] method.
    # @param [String] path.
    # @param [Hash] params (optional).
    # @param [Hash] body (optional).
    # @param [Hash] headers request headers (optional).
    # @raise [ArgumentError] If the response is blank.
    # @raise [ResourceNotFoundError] If the response code is 404.
    # @raise [ClientError] If the response code is not in the success range.
    # @return [Faraday::Response] server response.
    def request(method, path, params = {}, body = {}, headers = HEADERS)
      msg = "Unsupported method #{method.inspect}. Only :get, :post, :put, :patch, :delete are allowed"
      raise ArgumentError, msg unless REQUESTS.include?(method)

      request_url = UrlHelper.build_url(path: "#{@url}#{path}", params: params)
      payload = nil
      accept = headers.present? ? headers['Accept'] : nil
      headers['Authorization'] = "Bearer #{@api_key}"

      if body.present?
        if accept.present? && accept == 'application/vnd.api+json'
          payload = JSON.generate(body)
        else
          payload = body
        end
      end
      response = @connection.run_request(method, request_url, payload, headers)

      case response.status.to_i
      when 200..299
        return response
      when 400
        return response
      when 422
        raise GapClient::Errors::UnprocessableEntityError.new(response.body)
      when 404
        raise GapClient::Errors::ResourceNotFoundError.new(response.body)
      else
        raise GapClient::Errors::ClientError.new(response.body)
      end
    end
  end
end
