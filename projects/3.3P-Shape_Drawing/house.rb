#require 'rubygems'
require 'gosu'
require './circle'

# The screen has layers: Background, middle, top
module ZOrder
  BACKGROUND, MIDDLE, TOP = *0..2
end

class DemoWindow < Gosu::Window
  def initialize
    super(640, 400, false)
  end

  def draw
    draw_quad(0, 0, 0xff_ffffff, 640, 0, 0xff_ffffff, 0, 400, 0xff_ffffff, 640, 400, 0xff_ffffff, ZOrder::BACKGROUND)
    draw_quad(220, 150, Gosu::Color.argb(0xff_1e90ff), 420, 150, Gosu::Color.argb(0xff_1e90ff), 220, 300, Gosu::Color.argb(0xff_1e90ff), 420, 300, Gosu::Color.argb(0xff_1e90ff), ZOrder::MIDDLE)
    draw_triangle(180, 150, Gosu::Color.argb(0xff_ff4757), 320, 40, Gosu::Color.argb(0xff_ff4757), 460, 150, Gosu::Color.argb(0xff_ff4757), ZOrder::MIDDLE, mode=:default)
    draw_quad(230, 220, Gosu::Color.argb(0xff_2d3436), 280, 220, Gosu::Color.argb(0xff_2d3436), 230, 300, Gosu::Color.argb(0xff_2d3436), 280, 300, Gosu::Color.argb(0xff_2d3436), ZOrder::MIDDLE)
    draw_quad(320, 220, Gosu::Color.argb(0xff_2d3436), 400, 220, Gosu::Color.argb(0xff_2d3436), 320, 270, Gosu::Color.argb(0xff_2d3436), 400, 270, Gosu::Color.argb(0xff_2d3436), ZOrder::MIDDLE)
    draw_quad(320, 160, Gosu::Color.argb(0xff_2d3436), 400, 160, Gosu::Color.argb(0xff_2d3436), 320, 200, Gosu::Color.argb(0xff_2d3436), 400, 200, Gosu::Color.argb(0xff_2d3436), ZOrder::MIDDLE)
    draw_quad(230, 160, Gosu::Color.argb(0xff_2d3436), 300, 160, Gosu::Color.argb(0xff_2d3436), 230, 200, Gosu::Color.argb(0xff_2d3436), 300, 200, Gosu::Color.argb(0xff_2d3436), ZOrder::MIDDLE)

    draw_quad(0, 300, Gosu::Color.argb(0xff_2ed573), 640, 300, Gosu::Color.argb(0xff_2ed573), 0, 640, Gosu::Color.argb(0xff_2ed573), 640, 400, Gosu::Color.argb(0xff_2ed573), ZOrder::MIDDLE)

    img2 = Gosu::Image.new(Circle.new(50))
    img2.draw(0, 0, ZOrder::TOP, 1.0, 1.0, Gosu::Color.argb(0xff_ffa502))
end
end

DemoWindow.new.show
