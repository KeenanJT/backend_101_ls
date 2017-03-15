############################## Work With Blocks
# There will be a lot of examples that need to be broken down.

########### Questions to ask when evaluating code
# => What is the type of action being performs (method call, block, conditional, etc..)?
# => What is the object that action is being performed on?
# => What is the side-effect of that action (e.g. output or destructive action)?
# => What is the return value of that action?
# => Is the return value used by whatever instigated the action?

# Some create a chat with the questions and answers.

####### EXAMPLE 1
[[1,2], [3,4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1,2], [3,4]]

# Breakdown
# Array#each method is being called on the multi-dimensional array [[1,2], [3,4]]
# Inner array is passed to the block and assigned to local variable |arr| (or just arr)
# Array#first method is called on arr and returns the object at index 0 of current array
# Value 1 is outputted from the first inner array while value 3 is outputted from the second (both values become strings)
# puts returns nil, therefore the block returns nil
# Array#each doesn't check the block return value for anything as it's just for iteration. It returns the calling object (original object)

####### EXAMPLE 2
[[1,2], [3,4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]

# Breakdown
# Biggest difference is using Array#map vs Array#each
# Array#map return value is based on the block, meaning it's affect by the last line of code
# puts return nil, thus this example returns two nils

####### EXAMPLE 3
[[1,2], [3,4]].map do |arr|
  puts arr.first
  arr.first
end
# 1
# 3
# => [1,3]

# Breakdown
# => What is the type of action being performs (method call, block, conditional, etc..)?
# a map method call on an array
# The block of the call will affect the output of map
# => What is the object that action is being performed on?
# map method on array
# puts on the local variable arr then first method called on local variable
# next line has another usage of the local variable arr with the first method being called
# => What is the side-effect of that action (e.g. output or destructive action)?
# since arr.first is the last expression of the block it'll affect the output since map looks to the last expression to create a new output
# => What is the return value of that action?
# 1 and 3
# => Is the return value used by whatever instigated the action?
# Yes by the map method, thus returning the array [1,3]

####### EXAMPLE 4
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
# 18
# 7
# 12
# => [[18, 7], [3, 12]]

# Breakdown
# => What is the type of action being performs (method call, block, conditional, etc..)?
# two Array#each method calls, two blocks, and one conditional
# => What is the object that action is being performed on?
# The first each is breaking the inner array out from being nested, the second is grabbing the elements out of the inner array
# The conditional is then evaluating the the local variable num and putting the values that are higher than 5
# => What is the side-effect of that action (e.g. output or destructive action)?
# puts return nil to the block, but since it's an each it doesn't matter
# => What is the return value of that action?
# nil on the block, but the original nested array since it's an each method call
# => Is the return value used by whatever instigated the action?
# Nope each does not check the block return value

####### EXAMPLE 5
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
# => [[2,4], [6, 8]]

# Breakdown
# => What is the type of action being performs (method call, block, conditional, etc..)?
# two map method calls, and two blocks being evaluate
# => What is the object that action is being performed on?
# map is called on the original array and the inner arrays.
# => What is the side-effect of that action (e.g. output or destructive action)?
# First map will output the new numbers being transformed (num * 2)
# => What is the return value of that action?
# [[2,4], [6, 8]]
# => Is the return value used by whatever instigated the action?
# Yes as it's looking to return it

####### EXAMPLE 6
[{ a: 'ant', b: 'elephant'}, {c: 'cat'}].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]

# Breakdown
# Using all? method within the select block, because select cares about the truthiness of the block's return value.
# value[0] == key.to_s is to test wheter all keys match the first letter of all their asscoiate values
# {:c => 'cat'} meets this criteria because c a t is in at least one of the values

####### EXAMPLE 7
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
arr.sort # => [["1", "8", "11"], ["1", "8", "9"], ["2", "12", "15"], ["2", "6", "13"]]
# We're using string sort, which isn't what we want. We want numerical sort0
arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]

# Breakdown
# When calling a transformation method within a sort_by method's block. The transformed elements
# are what are then used to perform the comparison.
# As long as what is returned by the block is comparable, we can perform whatever transformation we need to within the block
# each time the top-level block is called, we call map on the sub-array for that iteration, within the map block we call to_i
# on each string within that particular sub-array, which returns a new array with integers and leaves the original sub-array unmodified.
# => This sorts the outer array by comparing the transformed integers in the inner array

####### EXAMPLE 8
# Double criteria for a nested array with two differing element types
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ["apple"]]

# Breakdown
# Using a map instead of select on the nested array will allow for a new array to be returned
# Intial part of the if statement checks if it's an integer, and the second part is for the letters

####### EXAMPLE 9
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]

# Breakdown
# Seeing that Array#each is right after Array#map the return value for map will be the same value as the original arry, but is a new array.

####### EXAMPLE 10
# Increasing elements by one
[[[1,2], [3,4]], [5,6]].map do |arr|
  arr.map do |element|
    if element.to_s.size == 1
      element + 1
    else
      element.map do |num|
        num + 1
      end
    end
  end
end
# => [[[2, 3], [4, 5]], [6, 7]]

# Breakdown
# The tricky part about this example is that the original array has uneven nested levels. 
# If we want to add 1 to each value we first need to find a way to access those values, regardless of how many arrays they're nested in. 
# To do this, we determine if the current element is an array or an integer and then execute the appropriate code.
# Array#map is a good choice because it returns a new array containing the transformed values, and same nested levels
