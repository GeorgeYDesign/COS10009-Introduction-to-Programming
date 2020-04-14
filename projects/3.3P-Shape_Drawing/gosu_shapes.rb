require 'rubygems'
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
    # see www.rubydoc.info/github/gosu/gosu/Gosu/Color for colours
    draw_quad(0, 0, 0xff_ffffff, 640, 0, 0xff_ffffff, 0, 400, 0xff_ffffff, 640, 400, 0xff_ffffff, ZOrder::BACKGROUND)
    draw_quad(5, 10, Gosu::Color::BLUE, 200, 10, Gosu::Color::AQUA, 5, 150, Gosu::Color::FUCHSIA, 200, 150, Gosu::Color::RED, ZOrder::MIDDLE)
    draw_triangle(50, 50, Gosu::Color::GREEN, 100, 50, Gosu::Color::GREEN, 50, 100, Gosu::Color::GREEN, ZOrder::MIDDLE, mode=:default)
    draw_line(200, 200, Gosu::Color::BLACK, 350, 350, Gosu::Color::BLACK, ZOrder::TOP, mode=:default)
    # draw_rect works a bit differently:
    Gosu.draw_rect(300, 200, 100, 50, Gosu::Color::BLACK, ZOrder::TOP, mode=:default)

    # Circle parameter - Radius
    img2 = Gosu::Image.new(Circle.new(50))
    # Image draw parameters - x, y, z, horizontal scale (use for ovals), vertical scale (use for ovals), colour
    # Colour - use Gosu::Image::{Colour name} or .rgb({red},{green},{blue}) or .rgba({alpha}{red},{green},{blue},)
    # Note - alpha is used for transparency.
    # drawn as an elipse (0.5 width:)
    img2.draw(200, 200, ZOrder::TOP, 0.5, 1.0, Gosu::Color::BLUE)
    # drawn as a red circle:
    img2.draw(300, 50, ZOrder::TOP, 1.0, 1.0, 0xff_ff0000)
    # drawn as a red circle with transparency:
    img2.draw(300, 250, ZOrder::TOP, 1.0, 1.0, 0x64_ff0000)

  end
end

DemoWindow.new.show
