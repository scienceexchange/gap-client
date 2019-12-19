require 'logger'
require 'jsonapi'

module GapClient
  module Resources
    class Object
      module Serializers
        module Object
          def self.serialize(value)
            value.to_s
          end

          def self.deserialize(value)
            case value
              when Array
                value.map { |v| v.deep_transform_keys{ |key| key.downcase } }
              when Hash
                value.deep_transform_keys{ |key| key.downcase }
              else
                value
            end
          end
        end

        module Time
          def self.serialize(value)
            value.utc.xmlschema
          end

          def self.deserialize(value)
            ::Time.parse(value)
          end
        end

        module ClassMethods
          # @return [Hash] corresponding serializers for different attributes
          def serializers
            @serializers ||= {}
          end

          # @param [String, Symbol] type type of attribute to be serialized or deserialized
          # @return [#serialize, #deserialize] serializer for provided type
          def serializer_for(type)
            serializers[type] ||=
              begin
                class_symbol = type.to_s.to_sym
                if type.respond_to?(:deserialize) && type.respond_to?(:serialize)
                  type
                elsif Serializers.constants.include?(class_symbol)
                  Serializers.const_get(class_symbol)
                elsif Resources.constants.include?(class_symbol)
                  Resources.const_get(class_symbol)
                else
                  Serializers::Object
                end
              end
          end

          # Deserialize a Faraday response.
          # @param [Faraday::Response] response.
          # @raise [ArgumentError] If the response is blank.
          # @return [Object, nil].
          def deserialize(response)
            raise ArgumentError, "Response cannot be blank" if response.blank?
            begin
              doc = JSON.parse(response.body)
              data = doc['data']
              meta = doc.try(:[], 'meta')
              ::JSONAPI.parse_response!(doc)

              case data
              when Array
                objects = []
                data.each do |o|
                  obj = get_object(o)
                  objects << new(obj)
                end
                return OpenStruct.new(data: objects, meta: meta)
              when Hash
                obj = get_object(data)
                return obj
              end

              return doc
            rescue ::JSONAPI::Parser::InvalidDocument => e
              Rails.logger.error(e)
              {}
            end
          end

          alias_method :parse, :deserialize

          def serialize(object)
            object.serialize
          end

          private def get_object(data)
            id = data.try(:[], 'id')
            attrs = data.try(:[], 'attributes')
            attrs['gap_client_id'] = id if id.present?
            rels = data.try(:[], 'relationships')

            if rels.present?
              rels.keys.each do |k|
                id = rels[k].try(:[], 'data').try(:[], 'id')
                attrs["#{k}_id"] = id if id
              end
            end

            new(attrs)
          end
        end

        def self.included(base)
          super
          base.extend ClassMethods
        end

        def serialize
          {}.tap do |result|
            attributes.each do |name, value|
              result[name.upcase] = self.class.serializer_for(name).serialize(value)
            end
          end
        end
      end
    end
  end
end
