
# Complete the code below

def main
	puts 'Enter the appetizer price (in cents)'
	appetizer_price = gets.chomp.to_i
	puts 'Enter the main price (in cents)'
	main_price = gets.chomp.to_i
	puts 'Enter the dessert price (in cents)'
	dessert_price = gets.chomp.to_i
	total_price = appetizer_price + main_price + dessert_price
	# Note: the following line changes the type of total_price from an integer to a float
	total_price = total_price.to_f / 100
	# print out the total_price with 2 decimal places:
	printf("$%.2f\n", total_price)
end

main
