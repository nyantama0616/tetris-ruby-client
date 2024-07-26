require 'gosu'
require_relative 'field'

class GameWindow < Gosu::Window
  def initialize
    super 640, 640
    self.caption = 'My First Game'
    @field = Field.new 320 - 132, 320 - 242, 22, 12 # TODO: 可読性悪い
  end

  def draw
    @field.draw
  end

  def button_down(id)
    close if id == Gosu::KB_SPACE
    @field.to_left if id == Gosu::KB_LEFT
    @field.to_right if id == Gosu::KB_RIGHT
    @field.to_buttom if id == Gosu::KB_DOWN
    @field.rotate_left if id == Gosu::KB_A
    @field.rotate_right if id == Gosu::KB_D
  end
end

window = GameWindow.new
window.show
