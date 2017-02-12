########################## Methods ##########################
# Ruby provides an easier way to work with collections through the use of built-in methods: each, select, and map.

####################### Each

# The each method is functionally equivalent to using loop and represents a simpler way of accomplishing the same task.

# This counter and loop is the same as...
numbers = [1, 2, 3]
counter = 0

loop do
  break if counter == numbers.size
  puts numbers[counter]
  counter += 1
end

# The each method on the array
[1, 2, 3].each do |num|
  puts num
end

# each is a method for the array that takes a block either do/end or {} to further customize the results.
# How does the block know what num is? 
# For each iteration, each sends the value of the current element to the block in the form of an argument. 
# In the above block, the argument to the block is num and it represents the value of the current element in the array.

# Each for Hash takes two arguments
hash = { a: 1, b: 2, c: 3 }

hash.each do |key, value|
  puts "The key is #{key} and the value is #{value}"
end

# Main difference between using a loop or the method is the return value

# **ONCE EACH IS DONE ITERATING IT WILL RETURN THE ORIGINAL COLLECTION.***

# EX 1: Each on the array
[1, 2, 3].each do |num|
  puts num
end
# Outputs
1
2
3
# Returns
=> [1,2,3]

# EX 2: Each in a method
def a_method
  [1, 2, 3].each do |num|
    puts num * 2
  end
end
# Outputs
2
4
6
# Returns
=> [1,2,3]

####################### Select

# Select method is the same as performing selection with a loop on arrays and hashes

# To perform selection, select evaluates the return value of the block. 
# The block returns a value on each iteration, which then gets evaluated by select. 
# Similar to a real method, the return value of the block is the return value of the last expression within the block.
# When evaluating the block's return value, select only cares about its truthiness.

# EX:
[1, 2, 3].select do |num|
  num.odd? # It will evaluate this and perform the action on the array | the criteria
end
# Returns
[1,3]

# Selection returns a new collection containing all the selected elements based on the criteria
# Always be aware of the return value of the block.

# EX: Return Nothing
[1, 2, 3].select do |num|
  num + 1
  puts num
end
# Outputs
1
2
3
# Return
=> []

####################### Map

# Similar to select, map also considers the return value of the block. 
# The main difference between these two methods is that map uses the return value of the block to perform transformation instead of selection.
# After evaluting the block it'll perform the action on the values and return a new collection

[1, 2, 3].map do |num|
  num * 2
end
# Returns a new collection
=> [2,4,6]

# Even if we write non-transformative intructions it'll return a new collection
[1, 2, 3].map do |num|
  num.odd?
end
# Returns a new collection that evaluated the numbers
=> [true,false,true]

# The key to remember here is that map always performs transformation based on the return value of the block. 

# Methods like each, select and map are provided by Ruby to allow for simpler implementations of common collection manipulation tasks. 
# Using these methods to iterate, select, and transform a collection is preferred over manually looping.

