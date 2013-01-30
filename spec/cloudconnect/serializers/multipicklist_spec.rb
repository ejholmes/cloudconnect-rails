require 'spec_helper'

describe CloudConnect::Serializers::Multipicklist do
  describe '.dump' do
    subject { described_class.new.dump(arr) }

    context 'when given an array' do
      let(:arr) { ['Foo', 'Bar'] }
      it { should eq 'Foo;Bar' }
    end

    context 'when given empty strings' do
      let(:arr) { ['', 'Foo'] }
      it { should eq 'Foo' }
    end
  end

  describe '.load' do
    subject { described_class.new.load(text) }

    context 'when given a string' do
      let(:text) { 'Foo;Bar' }
      it { should eq ['Foo', 'Bar'] }
    end

    context 'when given nil' do
      let(:text) { nil }
      it { should eq [] }
    end
  end
end
