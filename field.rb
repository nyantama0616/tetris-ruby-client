require_relative 'block'

BLOCK_SIZE = 20

class Field
  attr_reader :width, :height

  def initialize(x, y, height, width)
    @x = x
    @y = y
    @height = height
    @width = width

    @blocks = []
    height.times do |i|
      @blocks << []
      width.times do |j|
        x = @x + j * (BLOCK_SIZE + 2)
        y = @y + i * (BLOCK_SIZE + 2)
        @blocks[i] << Block.new(x, y, BLOCK_SIZE, BLOCK_SIZE)
      end
    end
  end

  def draw
    @height.times do |i|
      @width.times do |j|
        @blocks[i][j].draw
      end
    end
  end
end
