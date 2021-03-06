require 'active_support'
require 'active_support/core_ext'
require 'active_record'

require 'cloudconnect/version'
require 'cloudconnect/serializers'

module CloudConnect
  extend ActiveSupport::Concern

  included do
    self.table_name = self.to_s.underscore.singularize
  end

  module ClassMethods
    # Public: Specify the column as being a multipicklist. This allows you to
    # assign an array to the column and have it serialized properly to the
    # Salesforce storage format.
    #
    # Serializes ['Foo', 'Bar'] to 'Foo;Bar'.
    def multipicklist(column)
      serialize column, CloudConnect::Serializers::Multipicklist.new
    end
  end
end
