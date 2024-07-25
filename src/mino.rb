class Mino
  attr_reader :blocks

  def initialize(blocks)
    @blocks = blocks
  end

  # (0, 0)を中心に反時計回りに90度回転
  def rotate_right
    @blocks = @blocks.map do |block|
      x = -block[0]
      y = block[1]
      [y, x]
    end
  end

  # 1マス下に移動
  def to_buttom
    @blocks = @blocks.map do |block|
      x = block[1]
      y = block[0] + 1
      [y, x]
    end
  end

  # 1マス左に移動
  def to_left
    @blocks = @blocks.map do |block|
      x = block[1] - 1
      y = block[0]
      [y, x]
    end
  end
  
  # 1マス右に移動
  def to_right
    @blocks = @blocks.map do |block|
      x = block[1] + 1
      y = block[0]
      [y, x]
    end
  end

  #TODO: rotate_leftを実装
end
