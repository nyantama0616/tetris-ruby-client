require_relative 'block'
require_relative 'mino'
require_relative 'mino_shape'

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

        # ここで壁を作る
        if i < height - 1 && 0 < j && j < width - 1
          @blocks[i][j].is_active = false
        end
      end
    end

    @mino = nil
  end

  def draw
    @height.times do |i|
      @width.times do |j|
        @blocks[i][j].draw
      end
    end
  end

  def generate_mino
    @mino = Mino.new Mino::Shape::CONVEX
    @mino.to_right
    @mino.to_right
    @mino.to_buttom
    @mino.to_buttom
    @mino
  end

  private


end
