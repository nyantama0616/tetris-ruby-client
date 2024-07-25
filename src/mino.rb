class Mino
  attr_reader :blocks

  def initialize(blocks)
    @blocks = blocks
  end

  # (0, 0)を中心に左回りに90度回転
  def rotate_left
      new_blocks = @blocks.map do |block|
        x = block[0]
        y = -block[1]
        [y, x]
      end

      Mino.new(new_blocks) 
  end

  # (0, 0)を中心に右回りに90度回転
  def rotate_right
    new_blocks = @blocks.map do |block|
      x = -block[0]
      y = block[1]
      [y, x]
    end

    Mino.new(new_blocks)
  end

  # 1マス下に移動
  def to_buttom
    new_blocks = @blocks.map do |block|
      x = block[1]
      y = block[0] + 1
      [y, x]
    end

    Mino.new(new_blocks)
  end

  # 1マス左に移動
  def to_left
    new_blocks = @blocks.map do |block|
      x = block[1] - 1
      y = block[0]
      [y, x]
    end

    Mino.new(new_blocks)
  end
  
  # 1マス右に移動
  def to_right
    new_blocks = @blocks.map do |block|
      x = block[1] + 1
      y = block[0]
      [y, x]
    end

    Mino.new(new_blocks)
  end
end
