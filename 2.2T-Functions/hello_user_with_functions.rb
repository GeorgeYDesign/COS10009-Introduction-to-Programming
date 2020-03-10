require 'date'
require './input_functions'

# Multiply metres by the following to get inches:
INCHES = 39.3701

# Insert into the following your hello_user code
# from task 1.3P and modify it to use the functions
# in input_functions

def main()

  # HOW TO USE THE input_functions CODE
  # Example of how to read strings:

  name = read_string('What is your name?')
  puts "Your name is " + name + "!"
  family_name = read_string('What is your family name?')
  puts "Your family name is " + family_name + "!"
  year_born = read_integer('What year were you born?')
  age = Date.today.year - year_born.to_i
  puts 'So you are ' + age.to_s + ' years old'
  height = read_float('Enter your height in metres (i.e as a float): ')
  height_inches = height * INCHES
  puts ('Your height in inches is: ' + height_inches.to_s)
  continue = read_boolean("Do you want to continue?")
  if (continue)
    puts 'Ok, lets continue '
    main()
  else
    puts 'ok, goodbye '
  end

	 # Now if you know how to do all that
   # Copy in your code from your completed
	 # hello_user Task 1.3 P. Then modify it to
	 # use the code in input_functions.
   # use read_string for all strings (this will
   # remove all whitespace)
end

main()
