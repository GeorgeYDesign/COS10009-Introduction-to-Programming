require 'gosu'

module ZOrder
  BACKGROUND, MIDDLE, TOP = *0..2
end

SCREEN_WIDTH = 600  # needs to be COUNT * COLUMN_WIDTH
SCREEN_HEIGHT = 200 # Should be multiple of 100
MAX_VALUE = 100 # the range of the data 1 to 100
COUNT = 30 # Number of items
COL_WIDTH = 20  # suggested at least 10

class Column
  # have a pointer to the neighbouring cells
  attr_accessor :height, :value

  # take in a value up to MAX_VALUE and calculate from
  # this and the SCREEN_HEIGHT the height of the bar
  # to be displayed.
  def initialize(value)
    @value = value
    @height = (SCREEN_HEIGHT/MAX_VALUE) * value
  end
end

# Instructions:

class GameWindow < Gosu::Window

  # initialize creates a window with a width an a height
  # and a caption. It also sets up any variables to be used
  # in this case an array of columns each with a random value
  # from this value and the constants above each column calculates the
  # height of its bar to be displayed.
  # This is procedure i.e the return value is 'undefined'
  def initialize
    super SCREEN_WIDTH, SCREEN_HEIGHT, false
    self.caption = "Sort Visualiser"
    @path = nil
    @do_insert = false

    @columns = Array.new(COUNT)

    # Create the columns and initialise each with a random value
    column_index = 0
    while (column_index < COUNT)
      col = Column.new(rand(MAX_VALUE + 1))
      @columns[column_index] = col
      column_index += 1
    end

    # Create a text font to display the value at the bottom of each bar
    @text_font = Gosu::Font.new(10)
  end

  # this is called by Gosu to see if should show the cursor (or mouse)
  def needs_cursor?
    true
  end

  # When comparing elements we need to compare the *values*.
  # This code is taken from the code selection_sort.rb in the
  # task's resources.   The outer loop is then moved up into the
  # Gosu cycle so that we can draw the array changing as the outer
  # loop executes.
  def insertion_sort(loop)
    # Insert lowest number in the column array at the right place in the array
      # Now start at current bottom and move toward column[i]
     j = loop
     done = false
     while ((j > 0) and (!done))
       # If the bottom value is lower than values above it, swap it until it
       # lands in a place where it is not lower than the next item above it
       if (@columns[j].value < @columns[j - 1].value)
         temp = @columns[j - 1]
         @columns[j - 1] = @columns[j]
         @columns[j] = temp
       else
         done = true
       end
       j = j - 1
     end
  end

  def bubble_sort(loop)
    num_item = loop
    for i in (0..num_item)
      for j in ((i + 1)..num_item)
        if ((@columns[i].value) > (@columns[j].value))
          temp = @columns[j]
          @columns[j] = @columns[i]
          @columns[i] = temp
        end
      end
    end
  end

  # Reacts to button press
  # left button will do an insertion sort
  # Right button starts another sort (your choice)
  def button_down(id)
    case id
      when Gosu::MsLeft
        @do_insert = true
        @loop = 0
      when Gosu::MsRight
        # fill this in for your chosen sort algorithm
        @do_bubble = true
        @loop = 0
      end
  end

  # This now manages the outer loop of the sort algorithm
  # This is a procedure i.e the return value is 'undefined'
  def update
    # do an insertion sort, when finished update do_insert

    if (@do_insert)
      puts "Doing insert #{@loop}"
      if @loop < (COUNT)
        insertion_sort(@loop)
        @loop += 1
        sleep(0.5)
      else
        @do_insert = false
      end
    end
    if (@do_bubble)
      puts "Doing bubble #{@loop}"
      if @loop < (COUNT)
        bubble_sort(@loop)
        @loop += 1
        sleep(0.5)
      else
        @do_bubble = false
      end
    end
  end

  # Draw (or Redraw) the window
  # Draw the bars for each column and the value of each in text at the base
  # of each bar.
  def draw
    column_index = 0
    while (column_index < @columns.length)
      color = Gosu::Color::GREEN
      Gosu.draw_rect((column_index * COL_WIDTH), SCREEN_HEIGHT - @columns[column_index].height, COL_WIDTH, @columns[column_index].height, color, ZOrder::MIDDLE, mode=:default)
      @text_font.draw("#{@columns[column_index].value}", (column_index * COL_WIDTH) + 5, SCREEN_HEIGHT - 10, ZOrder::TOP, 1.0, 1.0, Gosu::Color::RED)
      column_index += 1
    end
  end
end

window = GameWindow.new
window.show
