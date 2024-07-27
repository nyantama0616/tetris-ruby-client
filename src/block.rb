require 'gosu'

class Block
  attr_reader :x, :y, :width, :height
  attr_accessor :is_active, :color

  def initialize(x, y, width, height)
    @x = x
    @y = y
    @width = width
    @height = height
    @is_active = true
    @color = Gosu::Color::WHITE
  end

  def draw
    return unless @is_active

    Gosu.draw_rect(@x, @y, @width, @height, @color)
  end

  def copy!(other)
    @is_active = other.is_active
    @color = other.color
  end
end
