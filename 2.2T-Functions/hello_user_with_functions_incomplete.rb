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

  s = read_string('Enter a String: ')
  puts "the string you entered was: " + s

  # Example of how to read integers:

  i = read_integer('Enter an Integer: ')
  puts "The Integer you entered was: " + i.to_s

  # Example of how to read floats:

  f = read_float('Enter a float (eg: 3.142): ')
  puts "The Float you entered was: " + f.to_s

  # Get the curent year from the system:

  y = Date.today.year
  puts "the current year is: " + y.to_s

	 # Now if you know how to do all that
   # Copy in your code from your completed
	 # hello_user Task 1.3 P. Then modify it to
	 # use the code in input_functions.
   # use read_string for all strings (this will
   # remove all whitespace)
end

main()
