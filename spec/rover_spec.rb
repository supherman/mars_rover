require 'spec_helper'

class Rover
  attr_accessor :facing

  def initialize(grid, params)
    @x = params[:x]
    @y = params[:y]
    @facing = params[:facing]
    @grid = grid
    @grid.set(@x, @y, self)
  end

  def move_forwards(quantity)
    @y -= quantity if @facing == :south
    @y += quantity if @facing == :north
    @x += quantity if @facing == :east
    @x -= quantity if @facing == :west
    @grid.set(@x, @y, self)
  end

  def move_backwards(quantity)
    @y += quantity if @facing == :south
    @y -= quantity if @facing == :north
    @x -= quantity if @facing == :east
    @x += quantity if @facing == :west
    @grid.set(@x, @y, self)
  end

  def turn_left
    case facing
      when :north then @facing = :west
      when :south then @facing = :east
      when :east then @facing = :north
      when :west then @facing = :south
    end
  end

end

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
end
