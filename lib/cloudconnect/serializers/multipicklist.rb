require 'active_support/core_ext/object/blank'

module CloudConnect
  module Serializers
    class Multipicklist
      def dump(arr)
        arr.select(&:present?).join(';')
      end

      def load(text)
        (text || '').split(';')
      end
    end
  end
end
