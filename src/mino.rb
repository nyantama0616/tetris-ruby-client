class Mino
  attr_reader :blocks

  def initialize(blocks, offset = [0, 0])
    @blocks = blocks
    @offset = offset
  end

  # (0, 0)を中心に左回りに90度回転
  def rotate_left
    new_blocks = @blocks.map do |block|
      x = block[0] + @offset[0]
      y = -(block[1] + @offset[1])
      [y, x].zip(@offset).map { |a, b| a - b }
    end

    Mino.new(new_blocks, @offset)
  end

  # (0, 0)を中心に右回りに90度回転
  def rotate_right
    new_blocks = @blocks.map do |block|
      x = -(block[0] + @offset[0])
      y = block[1] + @offset[1]
      [y, x].zip(@offset).map { |a, b| a - b }
    end

    Mino.new(new_blocks, @offset)
  end

  # 1マス下に移動
  def to_buttom
    new_blocks = @blocks.map do |block|
      x = block[1]
      y = block[0] + 1
      [y, x]
    end

    new_offset = [@offset[0] - 1, @offset[1]]

    Mino.new(new_blocks, new_offset)
  end

  # 1マス左に移動
  def to_left
    new_blocks = @blocks.map do |block|
      x = block[1] - 1
      y = block[0]
      [y, x]
    end

    new_offset = [@offset[0], @offset[1] + 1]

    Mino.new(new_blocks, new_offset)
  end

  # 1マス右に移動
  def to_right
    new_blocks = @blocks.map do |block|
      x = block[1] + 1
      y = block[0]
      [y, x]
    end

    new_offset = [@offset[0], @offset[1] - 1]

    Mino.new(new_blocks, new_offset)
  end
end
