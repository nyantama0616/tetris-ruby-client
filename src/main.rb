require 'gosu'
require_relative 'field'

class GameWindow < Gosu::Window
  def initialize
    super 640, 640
    self.caption = 'My First Game'
    @field = Field.new 320 - 132, 320 - 242, 22, 12 # TODO:
    @last_update_time = Gosu.milliseconds # TODO: handle_fall_minoのためだけにインスタンス変数持つのキモい
  end

  def update
    handle_fall_mino
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

  private

  def handle_fall_mino
    current_time = Gosu.milliseconds
    return unless current_time - @last_update_time >= 1000

    @field.to_buttom
    @last_update_time = current_time
  end
end

window = GameWindow.new
window.show
