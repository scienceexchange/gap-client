require 'delegate'
require 'json'
require 'time'

module GapClient
  module Resources
    class Object < SimpleDelegator
      require_dependency 'gap_client/resources/object/serializers'
      require_dependency 'gap_client/resources/object/attributes'

      include GapClient::Resources::Object::Serializers
      include GapClient::Resources::Object::Attributes

      # Define common attributes, applicable to different resources
      attribute :date_created_utc, Time
      attribute :date_updated_utc, Time

      def inspect
        "#<#{self.class.name}:#{'0x00%x' % (object_id << 1)} #{inspect_attributes}>"
      end

      private

      def inspect_attributes
        attributes.map { |key, value| "@#{key}=#{value.inspect}" }.join(' ')
      end
    end
  end
end
