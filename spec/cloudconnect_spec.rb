require 'spec_helper'

describe CloudConnect do
  before do
    Object.const_set(:MockModel, Class.new { include CloudConnect} )
  end

  after do
    Object.send(:remove_const, :MockModel)
  end

  describe '#multipicklist' do
    it 'serializes the field with the multipicklist serializer' do
      MockModel.should_receive(:serialize).with(:field, instance_of(CloudConnect::Serializers::Multipicklist))
      MockModel.class_eval do
        multipicklist :field
      end
    end
  end
end
