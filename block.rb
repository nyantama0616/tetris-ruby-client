require 'gosu'

class Block
  attr_reader :x, :y, :width, :height

  def initialize(x, y, width, height)
    @x = x
    @y = y
    @width = width
    @height = height
  end

  def draw
    Gosu.draw_rect(@x, @y, @width, @height, Gosu::Color::WHITE)
  end
end
