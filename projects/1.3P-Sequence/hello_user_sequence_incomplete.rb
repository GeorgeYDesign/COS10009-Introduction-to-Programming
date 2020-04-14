require 'date'

INCHES = 0.393701  # This is a global constant

# Insert the missing code here into the statements below:
# gets
# gets.chomp
# Date.today.year
# year_born.to_i
# gets.to_f

def main
	puts 'What is your name?'
	name =
	puts 'Your name is ' + name + '!'
	puts 'What is your family name?'
	family_name =
	puts 'Your family name is: ' + family_name + '!'
	puts 'What year were you born?'
	year_born =
	# Calculate the users age
	age =
	puts 'So you are ' + age.to_s + ' years old'
	puts 'Enter your height in cms (i.e as a float): '
	value =  # Should this be a float or an Integer? Why?
	value = value * INCHES
	puts 'Your height in inches is: '
	puts value.to_s
	puts 'Finished'
end

main  # call the main procedure
