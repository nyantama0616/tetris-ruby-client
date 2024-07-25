require 'gosu'
require_relative 'field'

class GameWindow < Gosu::Window
  def initialize
    super 640, 640
    self.caption = "My First Game"
    @field = Field.new 320 - 132, 320 - 242, 22, 12 # TODO: 可読性悪い
  end

  def draw
    @field.draw
  end

  def button_down(id)
    close if id == Gosu::KB_SPACE
  end
end

window = GameWindow.new
window.show
