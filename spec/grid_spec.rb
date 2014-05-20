require 'spec_helper'

require 'grid'

describe Grid do
  subject { described_class.new(100, 200) }

  it 'has a length' do
    expect(subject.length).to eql 100
  end

  it 'has a height' do
    expect(subject.height).to eql 200
  end

  describe '#set' do
    context 'When the given position is free' do
      it 'returns true' do
        expect(subject.set(2, 2, double('object'))).to be_true
      end
    end

    context 'When the given position is not free' do
      before do
        subject.set(2, 2, double('object'))
      end

      it 'returns false' do
        expect(subject.set(2, 2, double('object'))).to be_false
      end
    end
  end

  describe '#get' do
    let(:obj) { double('object') }

    before do
      subject.set(2, 2, obj)
    end

    it 'gets the object in a given position' do
      expect(subject.get(2,2)).to eql obj
    end
  end

  describe 'Spheric grid' do
    let(:obj) { double('object') }

    before do
      subject.set(120, 202, obj)
    end

    it 'should be spheric' do
      expect(subject.get(120, 202)).to eql obj
      expect(subject.get(20, 2)).to eql obj
    end
  end
end
