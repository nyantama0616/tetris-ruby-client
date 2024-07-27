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

    # TODO: 開発用に幾つかのブロックをアクティブにする。本番では削除する
    (1...5).each do |j|
      @blocks[@height - 2][j].is_active = true
    end
    (6...@width - 1).each do |j|
      @blocks[@height - 2][j].is_active = true
    end
    (1...3).each do |j|
      @blocks[@height - 3][j].is_active = true
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

  # 揃った行を消し、空行を埋め、消した行数を返す
  def arrange
    erased_lines = erase_lines

    offset = 0
    pos_erased_lines = 0

    (@height - 1).times.reverse_each do |i|
      if erased_lines[pos_erased_lines] == i
        offset += 1
        pos_erased_lines += 1
      else
        i_ = i + offset

        # シフト量0の場合は何もしない
        next if i_ >= @height - 1 || i_ == i

        (1...@width - 1).each do |j|
          @blocks[i_][j].copy!(@blocks[i][j])
        end
      end
    end

    erased_lines.length
  end

  private

  # 消せる行を消し、消した行のインデックスを返す
  def erase_lines
    erased_lines = []

    # 一番下の行から見ていく
    (@height - 1).times.reverse_each do |i|
      erased_lines << i if (1...@width - 1).all? { |j| @blocks[i][j].is_active }
    end

    erased_lines.each do |i|
      (1...@width - 1).each do |j|
        @blocks[i][j].is_active = false
      end
    end

    erased_lines
  end

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
