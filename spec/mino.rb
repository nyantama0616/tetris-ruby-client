require 'rspec'
require_relative '../src/mino'
require_relative '../src/mino_shape'

RSpec.describe Mino do
  describe 'convex' do
    before do
      @mino = Mino.new Mino::Shape::CONVEX
    end

    it 'rotate_left' do
      new_mino = @mino.rotate_left
      expect(new_mino.blocks).to eq [[1, -1], [1, 0], [0, 0], [1, 1]]
    end

    it 'rotate_right' do
      new_mino = @mino.rotate_right
      expect(new_mino.blocks).to eq [[-1, 1], [-1, 0], [0, 0], [-1, -1]]
    end

    it 'to_buttom' do
      new_mino = @mino.to_buttom
      expect(new_mino.blocks).to eq [[0, -1], [1, -1], [1, 0], [2, -1]]
    end

    it 'to_left' do
      new_mino = @mino.to_left
      expect(new_mino.blocks).to eq [[-1, -2], [0, -2], [0, -1], [1, -2]]
    end

    it 'to_right' do
      new_mino = @mino.to_right
      expect(new_mino.blocks).to eq [[-1, 0], [0, 0], [0, 1], [1, 0]]
    end
  end

  describe 'square' do
    before do
      @mino = Mino.new Mino::Shape::SQUARE
    end

    it 'rotate_right' do
      new_mino = @mino.rotate_right
      expect(new_mino.blocks).to eq [[-1, 1], [0, 1], [-1, 0], [0, 0]]
    end
  end

  describe 'lr' do
    before do
      @mino = Mino.new Mino::Shape::LR
    end

    it 'rotate_right' do
      new_mino = @mino.rotate_right
      expect(new_mino.blocks).to eq [[-1, 1], [-1, 0], [0, 0], [0, -1]]
    end
  end

  describe 'rl' do
    before do
      @mino = Mino.new Mino::Shape::RL
    end

    it 'rotate_right' do
      new_mino = @mino.rotate_right
      expect(new_mino.blocks).to eq [[0, 1], [0, 0], [-1, 0], [-1, -1]]
    end
  end

  describe 'bar' do
    before do
      @mino = Mino.new Mino::Shape::BAR
    end

    it 'rotate_right' do
      new_mino = @mino.rotate_right
      expect(new_mino.blocks).to eq [[0, 1], [0, 0], [0, -1], [0, -2]]
    end
  end

  describe 'L' do
    before do
      @mino = Mino.new Mino::Shape::L
    end

    it 'rotate_right' do
      new_mino = @mino.rotate_right
      expect(new_mino.blocks).to eq [[0, 1], [0, 0], [0, -1], [1, -1]]
    end
  end
end
