########### EXERCISES: Methods and More Methods

# Exercise 1 - What is the return value of the select method below? Why?
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
# ANSWER: 
  # => [1,2,3]; 
  # Select method is just looking to see if the block is truthy or falsey and will return a new array based on the block's return value.

# Exercise 2 - How does count treat the block's return value? How can we find out?
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
# ANSWER: 
  # If a block is given, counts the number of elements for which the block returns a true value.
  # Look in the docs

# Exercise 3 - What is the return value of reject in the following code? Why?
[1, 2, 3].reject do |num|
  puts num
end
# ANSWER:
  # => [1,2,3]
  # Returns a new array containing the items in self for which the given block is false.

# Exercise 4 - What is the return value of each_with_object in the following code? Why?
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
# ANSWER: 
  # => { "a" => "ant", "b" => "bear", "c" => "cat" }
  # Iterates the given block for each element with an arbitrary object given, and returns the initially given object.

# Exercise 5 - What does shift do in the following code? How can we find out?
hash = { a: 'ant', b: 'bear' }
hash.shift
# ANSWER:
  # => [a: "ant"]; takes the first pair in a hash and returns it as an array. It's a destructive method.
  # Doc description: Removes a key-value pair from hsh and returns it as the two-item array [ key, value ], or the hash’s default value if the hash is empty.

# Exercise 6 - What is the return value of the following statement? Why?
['ant', 'bear', 'caterpillar'].pop.size
# ANSWER:
  # => 11
  # Methoding chaining from pop which returns the last element in the collection, which is a string. We call size on the string, and it returns an integer.

# Exercise 7 - What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code. What gets output by this code?
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
# ANSWER: The return value of the block is determined by the return value of the last expression within the block. 
# In this case the last statement evaluated is num.odd?, which returns a boolean. 
#Therefore the block's return value will be a boolean, since Fixnum#odd? can only return true or false.

# Exercise 8 - How does take work? Is it destructive? How can we find out?
arr = [1, 2, 3, 4, 5]
arr.take(2)
# ANSWER:
  # => [1,2]
  # Returns first n elements from the array.
  # No it is not destructive.
  # You can read the docs or test it out. In the docs it says it returns a new array.

# Exercise 9 - What is the return value of map in the following code? Why?
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
# ANSWER:
  # => [nil, "bear"]
  # When none of the conditions in an if statement is evaluated, then the if statement returns nil. 
  # That's why we see nil as the first element in the returned array.

# Exercise 10 - What is the block's return value in the following code? Why?
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
# ANSWER:
  # => [1, nil, nil]
  # We can determine the block's return value by looking at the return value of the last statement evaluated within the block.