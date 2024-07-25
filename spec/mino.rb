require 'rspec'
require_relative '../src/mino'
require_relative '../src/mino_shape'

RSpec.describe Mino do
  describe 'rotate_right' do
    it "convex" do
      mino = Mino.new Mino::Shape::CONVEX
      mino.rotate_right
      expect(mino.blocks).to eq [[-1, 1], [-1, 0], [0, 0], [-1, -1]]
      end
      
    it "square" do
      mino = Mino.new Mino::Shape::SQUARE
      mino.rotate_right
      expect(mino.blocks).to eq [[-1, 1], [0, 1], [-1, 0], [0, 0]]
    end

    it "lr" do
      mino = Mino.new Mino::Shape::LR
      mino.rotate_right
      expect(mino.blocks).to eq [[-1, 1], [-1, 0], [0, 0], [0, -1]]
    end

    it "rl" do
      mino = Mino.new Mino::Shape::RL
      mino.rotate_right
      expect(mino.blocks).to eq [[0, 1], [0, 0], [-1, 0], [-1, -1]]
    end

    it "bar" do
      mino = Mino.new Mino::Shape::BAR
      mino.rotate_right
      expect(mino.blocks).to eq [[0, 1], [0, 0], [0, -1], [0, -2]]
    end
  end

  describe 'to_buttom' do
    it "convex" do
      mino = Mino.new Mino::Shape::CONVEX
      mino.to_buttom
      expect(mino.blocks).to eq [[0, -1], [1, -1], [1, 0], [2, -1]]
    end
  end

  describe 'to_left' do
    it "convex" do
      mino = Mino.new Mino::Shape::CONVEX
      mino.to_left
      expect(mino.blocks).to eq [[-1, -2], [0, -2], [0, -1], [1, -2]]
    end
  end

  describe 'to_right' do
    it "convex" do
      mino = Mino.new Mino::Shape::CONVEX
      mino.to_right
      expect(mino.blocks).to eq [[-1, 0], [0, 0], [0, 1], [1, 0]]
    end
  end
end
