require 'spec_helper'

describe CloudConnect do
  before do
    class MockModel
      def self.table_name=(table_name)
        @_table_name = table_name
      end

      def self.table_name
        @_table_name
      end

      include CloudConnect
    end
  end

  after do
    Object.send(:remove_const, :MockModel)
  end

  describe '#table_name' do
    subject { MockModel.table_name }
    it { should eq 'mock_model' }
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
