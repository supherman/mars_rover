require 'spec_helper'
require 'rover'
require 'grid'

describe Rover do
  let(:grid) { Grid.new(100, 100) }

  subject! { described_class.new grid, x: 0, y: 0, facing: :north }

  it 'has a position in a grid' do
    expect(grid.get(0,0)).to eql subject
  end

  describe '#move_forwards' do
    context 'facing north' do
      specify  do
        subject.move_forwards(10)
        expect(grid.get(0,10)).to eql subject
      end
    end

    context 'facing south' do
      before do
        subject.facing = :south
      end

      specify do
        subject.move_forwards(10)
        expect(grid.get(0,90)).to eql subject
      end
    end

    context 'facing east' do
      before do
        subject.facing = :east
      end

      specify do
        subject.move_forwards(10)
        expect(grid.get(10,0)).to eql subject
      end
    end

    context 'facing west' do
      before do
        subject.facing = :west
      end

      specify do
        subject.move_forwards(10)
        expect(grid.get(90,0)).to eql subject
      end
    end
  end

  describe '#move_backwards' do
    context 'facing north' do
      specify  do
        subject.move_backwards(10)
        expect(grid.get(0,90)).to eql subject
      end
    end

    context 'facing south' do
      before do
        subject.facing = :south
      end

      specify do
        subject.move_backwards(10)
        expect(grid.get(0,10)).to eql subject
      end
    end

    context 'facing east' do
      before do
        subject.facing = :east
      end

      specify do
        subject.move_backwards(10)
        expect(grid.get(90,0)).to eql subject
      end
    end

    context 'facing west' do
      before do
        subject.facing = :west
      end

      specify do
        subject.move_backwards(10)
        expect(grid.get(10,0)).to eql subject
      end
    end
  end

  describe '#turn_left' do
    context 'Facing north' do
      before do
        subject.facing = :north
      end

      specify do
        subject.turn_left
        expect(subject.facing).to eql :west
      end
    end

    context 'Facing south' do
      before do
        subject.facing = :south
      end

      specify do
        subject.turn_left
        expect(subject.facing).to eql :east
      end
    end

    context 'Facing east' do
      before do
        subject.facing = :east
      end

      specify do
        subject.turn_left
        expect(subject.facing).to eql :north
      end
    end

    context 'Facing west' do
      before do
        subject.facing = :west
      end

      specify do
        subject.turn_left
        expect(subject.facing).to eql :south
      end
    end
  end

  describe '#turn_right' do
    context 'Facing north' do
      before do
        subject.facing = :north
      end

      specify do
        subject.turn_right
        expect(subject.facing).to eql :east
      end
    end

    context 'Facing south' do
      before do
        subject.facing = :south
      end

      specify do
        subject.turn_right
        expect(subject.facing).to eql :west
      end
    end

    context 'Facing east' do
      before do
        subject.facing = :east
      end

      specify do
        subject.turn_right
        expect(subject.facing).to eql :south
      end
    end

    context 'Facing west' do
      before do
        subject.facing = :west
      end

      specify do
        subject.turn_right
        expect(subject.facing).to eql :north
      end
    end
  end

  describe '#move' do
    context 'When ffrff' do
      before do
        subject.move('ffrff')
      end

      specify do
        expect(grid.get(2,2)).to eql subject
      end
    end

    context 'When frffblrf' do
      before do
        subject.move('frffblrf')
      end

      specify do
        expect(grid.get(2,1)).to eql subject
      end
    end
  end
end
