require './input_functions'

# write code that reads in a user's name from the terminal.  If the name matches
# your name or your tutor's name, then print out "<Name> is an awesome name!"
# Otherwise call a function called print_silly_name(name) - which you must write -
# that prints out "<Name> is a " then print 'silly' (60 times) on one long line
# then print ' name.'

def print_silly_name(name)
	i = 0
	printf("%s is a ", name)
		while i < 60
			printf("silly ", i)
			i+= 1
		end
	printf("name")
end

def main
	name = read_string("Please Enter your name: ")
		if (name.downcase == "george")
			printf("%s is an awesome name!", name)
		else
			print_silly_name(name)
		end
end

main
