require 'gosu'
require 'texplay'

class GameWindow < Gosu::Window
  def initialize
    super 200, 200, false
    self.caption = "My Picture"
    @blank_image = TexPlay.create_blank_image(self, 200, 200)
  end

  def update

  end

  def draw
  	@blank_image.paint{rect 0, 0, 200, 200, :color => :white, :fill => true}
    @blank_image.paint{rect 40, 40, 50, 50, :color => :blue, :fill => true}
    @blank_image.paint{circle 20, 20, 30, :color => :red, :fill => true}
    @blank_image.paint{line 100, 50, 100, 150, :color => :green}
   	@blank_image.draw(0,0,0)
  end
end

window = GameWindow.new
window.show
