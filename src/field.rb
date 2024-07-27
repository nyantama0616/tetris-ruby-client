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

    init_field
  end

  def draw
    @height.times do |i|
      @width.times do |j|
        @blocks[i][j].draw
      end
    end
  end

  def init_field
    @blocks = []
    height.times do |i|
      @blocks << []
      width.times do |j|
        x = @x + j * (BLOCK_SIZE + 2)
        y = @y + i * (BLOCK_SIZE + 2)
        @blocks[i] << Block.new(x, y, BLOCK_SIZE, BLOCK_SIZE)

        # ここで壁を作る
        @blocks[i][j].is_active = false if i < height - 1 && 0 < j && j < width - 1
      end
    end
  end

  def init_mino
    @mino = generate_mino

    @mino.blocks.each do |i, j|
      return false if @blocks[i][j].is_active
    end

    true
  end

  # TODO: リファクタリング leftとrightほぼ処理一緒
  def to_left
    return false unless @mino

    new_mino = @mino.to_left

    return false unless apply(new_mino)

    @mino = new_mino

    true
  end

  def to_right
    return false unless @mino

    new_mino = @mino.to_right

    return false unless apply(new_mino)

    @mino = new_mino

    true
  end

  def to_bottom
    return false unless @mino

    new_mino = @mino.to_bottom

    return false unless apply(new_mino)

    @mino = new_mino

    true
  end

  def to_bottom_immidiately
    return false unless @mino

    ok = false

    new_mino = @mino.to_bottom
    while apply(new_mino)
      ok = true
      @mino = new_mino
      new_mino = @mino.to_bottom
    end

    ok
  end

  def rotate_left
    return false unless @mino

    new_mino = @mino.rotate_left

    return false unless apply(new_mino)

    @mino = new_mino

    true
  end

  def rotate_right
    return false unless @mino

    new_mino = @mino.rotate_right

    return false unless apply(new_mino)

    @mino = new_mino

    true
  end

  private

  def generate_mino
    new_mino = Mino.generate
    6.times do
      new_mino = new_mino.to_right
    end
    new_mino.to_bottom
  end

  def apply(mino)
    # 現在のミノを非表示にする
    @mino&.blocks&.each do |i, j|
      @blocks[i][j].is_active = false
    end

    ok = true
    mino.blocks.each do |i, j|
      if !(0 <= i && i < @height - 1) || !(0 < j && j < @width - 1) || @blocks[i][j].is_active
        ok = false
        break
      end
    end

    unless ok
      # 現在のミノを再び表示する
      @mino&.blocks&.each do |i, j|
        @blocks[i][j].is_active = true
      end

      return false
    end

    mino.blocks.each do |i, j|
      @blocks[i][j].is_active = true
    end

    true
  end
end
