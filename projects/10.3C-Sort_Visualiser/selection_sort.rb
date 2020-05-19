# Code for selection sort
# Based on code in: Freider, O, Frieder, G & Grossman, D. 2013 Computer Science Programming Basics in Ruby, O’Reilly Media Inc.

# 35 ITEMS to be sorted
NUM_ITEMS = 35
# Max VALUE of 100%
MAX_VALUE = 100

num_compare = 0
arr = Array.new(NUM_ITEMS)

# Randomly populate arr
for i in (0..NUM_ITEMS - 1)
    # Maximum possible value is 100, keep in mind that rand(5) returns
    # possible values 0-4, so we must add 1 to MAX_VALUE
    arr[i] = rand(MAX_VALUE + 1)
end

# Output current values of arr
puts "Input list:"
for i in (0..NUM_ITEMS - 1)
  puts "arr[" + i.to_s + "] ==> " + arr[i].to_s
end

# Now let's use a selection sort. We first find the lowest number in the
# array and then we move it to the beginning of the list
for i in (0..NUM_ITEMS - 2)
  min_pos = i
  for j in (i + 1)..(NUM_ITEMS - 1)
    num_compare = num_compare + 1
    if (arr[j] < arr[min_pos])
      min_pos = j
    end
  end

  # Knowing the min, swap with current first element (at position i)
  temp = arr[i]
  arr[i] = arr[min_pos]
  arr[min_pos] = temp
end

# Now output the sorted array
puts "Sorted list:"
for i in (0..NUM_ITEMS - 1)
  puts "arr[" + i.to_s + "] ==> " + arr[i].to_s
end

puts "Number of Comparisons ==> " + num_compare.to_s
