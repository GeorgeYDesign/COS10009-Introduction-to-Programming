require 'rubygems'
require 'gosu'

module ZOrder
  BACKGROUND, FOOD, PLAYER, UI = *0..3
end

WIN_WIDTH = 600
WIN_HEIGHT = 800

class Hunter
  attr_accessor :score, :image, :yuk, :yum, :hunted, :hunted_image, :vel_x, :vel_y, :angle, :x, :y, :score

  def initialize(hunted)
    @image = Gosu::Image.new("media/Hunter.PNG")
    @yuk = Gosu::Sample.new("media/Yuk.wav")
    @yum = Gosu::Sample.new("media/Yum.wav")

    @hunted = hunted
    @hunted_image = Gosu::Image.new("media/SmallIcecream.png")

    @vel_x = @vel_y = 3.0
    @x = @y = @angle = 0.0
    @score = 0
  end
end

def set_hunted(hunter, hunted)
  hunter.hunted = hunted
  case hunted
  when :chips
    hunted_string = "media/" + "SmallChips.png"
  when :icecream
    hunted_string = "media/" + "SmallIcecream.png"
  when :burger
    hunted_string = "media/" + "SmallBurger.png"
  when :pizza
    hunted_string = "media/" + "SmallPizza.png"
  end
  hunter.hunted_image = Gosu::Image.new(hunted_string)
end

def warp(hunter, x, y)
  hunter.x, hunter.y = x, y
end

def move_left hunter
  hunter.x -= hunter.vel_x
  hunter.x %= WIN_WIDTH
end

def move_right hunter
  hunter.x += hunter.vel_x
  hunter.x %= WIN_WIDTH
end

def move_up hunter
  hunter.y -= hunter.vel_y
  hunter.y %= WIN_HEIGHT
end

def move_down hunter
  hunter.y += hunter.vel_y
  hunter.y %= WIN_HEIGHT
end

def draw_hunter hunter
  hunter.image.draw_rot(hunter.x, hunter.y, ZOrder::PLAYER, hunter.angle)
  hunter.hunted_image.draw_rot(hunter.x, hunter.y, ZOrder::PLAYER, hunter.angle)
end

def collect_food(all_food, hunter)
  all_food.reject! do |food|
    if (Gosu.distance(hunter.x, hunter.y, food.x, food.y) < 80)
      if (food.type == hunter.hunted)
        hunter.score += 1
        hunter.yum.play
      else
        hunter.score += -1
        hunter.yuk.play
      end
      true
    else
      false
    end
  end
end


class Food

  attr_accessor :x, :y, :type, :image, :vel_x, :vel_y, :angle, :x, :y, :score

  def initialize(image, type)
    @type = type;
    @image = Gosu::Image.new(image);
    @vel_x = rand(-2 .. 2)
    @vel_y = rand(-2 .. 2)
    @angle = 0.0
    @x = rand * WIN_WIDTH
    @y = rand * WIN_HEIGHT
    @score = 0
  end
end

def move food
  food.x += food.vel_x
  food.x %= WIN_WIDTH
  food.y += food.vel_y
  food.y %=WIN_HEIGHT
end

def draw_food food
  food.image.draw_rot(food.x, food.y, ZOrder::FOOD, food.angle)
end


class FoodHunterGame < (Example rescue Gosu::Window)
  def initialize
    super WIN_WIDTH, WIN_HEIGHT
    self.caption = "Food Hunter Game"

    @background_image = Gosu::Image.new("media/space.png", :tileable => true)

    @all_food = Array.new

    @player = Hunter.new(:icecream)

    warp(@player, 320, 240)

    @font = Gosu::Font.new(20)
  end

  def update
    if Gosu.button_down? Gosu::KB_LEFT or Gosu.button_down? Gosu::GP_LEFT
      move_left @player
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu.button_down? Gosu::GP_RIGHT
      move_right @player
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu.button_down? Gosu::GP_BUTTON_0
      move_up @player
    end
    if Gosu.button_down? Gosu::KB_DOWN or Gosu.button_down? Gosu::GP_BUTTON_9
      move_down @player
    end


    @all_food.each { |food| move food }

    self.remove_food

    collect_food(@all_food, @player)

   if rand(100) < 2 and @all_food.size < 4
      @all_food.push(generate_food)
      if rand(100)<60
        a = rand(@all_food.size)
        @all_food[a].x -= @all_food[a].x + 1
        @all_food[a].y -= @all_food[a].y + 1
        printf("reveres")
      end
   end

   if rand(WIN_HEIGHT) == 0
     change = rand(4)
     case change
      when 0
        set_hunted(@player, :icecream)
      when 1
        set_hunted(@player, :chips)
      when 2
        set_hunted(@player, :burger)
      when 3
        set_hunted(@player, :pizza)
     end
   end
 end

  def draw
    @background_image.draw(0, 0, ZOrder::BACKGROUND)
    draw_hunter @player
    @all_food.each { |food| draw_food food }
    @font.draw("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)
  end

  def generate_food
    case rand(4)
    when 0
      Food.new("media/Chips.png", :chips)
    when 1
      Food.new("media/Burger.png", :burger)
    when 2
      Food.new("media/IceCream.png", :icecream)
    when 3
      Food.new("media/Pizza.png", :pizza)
    end
  end

  def remove_food
    @all_food.reject! do |food|
      if food.x > WIN_WIDTH || food.y > WIN_HEIGHT || food.x < 0 || food.y < 0
        true
      else
        false
      end
    end
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end

FoodHunterGame.new.show if __FILE__ == $0
