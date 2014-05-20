class Grid
  attr_reader :length, :height

  def initialize(length, height)
    @length = length
    @height = height
    @space  = Array.new(length) { Array.new(height) }
  end

  def set(x, y, object)
    spheric_x = x % length
    spheric_y = y % height
    @space[spheric_x][spheric_y] = object if @space[spheric_x][spheric_y].nil?
  end

  def get(x, y)
    spheric_x = x % length
    spheric_y = y % height
    @space[spheric_x][spheric_y]
  end
end
