class Rover
  attr_accessor :facing

  COMMANDS = {
      'f' => :move_forwards,
      'b' => :move_backwards,
      'l' => :turn_left,
      'r' => :turn_right
  }

  FORDWARD_MOVEMENTS = {
      south: :move_back_in_y,
      north: :advance_in_y,
      east: :advance_in_x,
      west: :move_back_in_x,
  }

  BACKWARD_MOVEMENTS = {
      south: :advance_in_y,
      north: :move_back_in_y,
      east: :move_back_in_x,
      west: :advance_in_x,
  }

  TURN_LEFT_MOVEMENTS = {
      north: :west,
      south: :east,
      east: :north,
      west: :south,
  }

  TURN_RIGHT_MOVEMENTS = {
      north: :east,
      south: :west,
      east: :south,
      west: :north,
  }

  def initialize(grid, params)
    @x      = params[:x]
    @y      = params[:y]
    @facing = params[:facing]
    @grid   = grid
    @grid.set(@x, @y, self)
  end

  def move_forwards(quantity = 1)
    send FORDWARD_MOVEMENTS[facing], quantity
    @grid.set(@x, @y, self)
  end

  def move_backwards(quantity = 1)
    send BACKWARD_MOVEMENTS[facing], quantity
    @grid.set(@x, @y, self)
  end

  def turn_left
    @facing = TURN_LEFT_MOVEMENTS[facing]
  end

  def turn_right
    @facing = TURN_RIGHT_MOVEMENTS[facing]
  end

  def move(command)
    command.chars.each do |char|
      send COMMANDS[char]
    end
  end

  private

  def advance_in_x(quantity)
    @x += quantity
  end

  def advance_in_y(quantity)
    @y += quantity
  end

  def move_back_in_x(quantity)
    @x -= quantity
  end

  def move_back_in_y(quantity)
    @y -= quantity
  end
end
