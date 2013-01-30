require 'active_support'
require 'active_record'

require 'cloudconnect/version'
require 'cloudconnect/serializers'

module CloudConnect
  extend ActiveSupport::Concern

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
