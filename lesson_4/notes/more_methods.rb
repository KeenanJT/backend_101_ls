################################### More Methods ###################################
# There are a lot of methods that Ruby already has built into it, especially for collections.
# A LOT live in the enumerable module

########################## Enumerable#any?
# Check block return value if any are truthy for method's return value

# any? [{ |obj| block }] -> true or false

# Passes each element of the collection to the given block. The method returns true if the block
# ever returns a value other than false or nil. If the block is not given, Ruby adds and implicit
# block of { |obj| obj } that will cause any? to return true if at least one of the collection
# members is not false or nil

# EXAMPLES from Ruby Doc:
%w[ant bear cat].any? { |word| word.length >= 3 } #=> true
%w[ant bear cat].any? { |word| word.length >= 4 } #=> true
[nil, true, 99].any?                              #=> true

# EXAMPLE from LS:
[1,2,3].any? do |num|
  num > 2
end
# => true

# Two return values we need to look at
# => return value of the method
# => return value of the block
  # => value of the block returns truthy or falsey, which determines what the method's return value will be.

# EXAMPLE any? on a hash:
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
# => false

# Hashes require a key and value to evaluate. The block's return value is checked just like an array for the method
# to return its BOOL.

########################## Enumerable#all?
# Check block's return value for truthiness. Method returns true if every iteration in block is truthy.

# all? [{ |obj| block }] -> true or false

# Passes each element of the collection to the given block. The method returns true if the block never returns false
# or nil. If the block is not given, Ruby adds an implicit block of {|obj| obj} which will cause all? to return true
# when none of the collection members are false or nil.

# EXAMPLE from Ruby Doc:
%w[ant bear cat].all? { |word| word.length >= 3 } #=> true
%w[ant bear cat].all? { |word| word.length >= 4 } #=> false
[nil, true, 99].all?                              #=> false

# EXAMPLE from LS for array:
[1, 2, 3].all? do |num|
  num > 2
end
# => false

# EXAMPLE from LS for hash:
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
# => true

########################## Enumerable#each_with_index
# Ignores block return value, and takes two arguements: var and index.

# each_with_index(*args) {|obj,i| block} -> enum
# each_with_index(*args) -> an_enumerator

# Calls block with two arguments, the item and its index, for each item in enum. Given arguments are passed through to each().
# If no block is given, an enumerator is returned instead.
# Returns original collection object
# Hash has two arguements, but the frst arguement is converting the key-value pair into an array.

# EXAMPLE from Ruby Doc:
hash = Hash.new
%w(cat dog wombat).each_with_index do |item, index|
  hash[item] = index
end
hash # => {"cat"=>0, "dog"=>1, "wombat"=>2}

# EXAMPLE from LS array:
[1,2,3].each_with_index do |num, index|
  puts "The index #{num} is #{index}."
end
# output
# The index of 1 is 0.
# The index of 2 is 1.
# The index of 3 is 2.
# return
# => [1, 2, 3]

# EXAMPLE from LS hash:
{a: "ant", b: "bear", c: "cat"}.each_with_index do |pair, index|
  puts "The index of #{pair} is #{index}."
end
# output
# The index of [:a, "ant"] is 0.
# The index of [:b, "bear"] is 1.
# The index of [:c, "cat"] is 2.
# return
# => { :a => "ant", :b => "bear", :c => "cat" }

########################## Enumerable#each_with_object
# Takes two arguments 
# => 1st argument represents current element
# => 2nd argument represents the collection object that was passed in as an argument to the method.
# Method will return the collection object that was passed in.

# each_with_object(obj) {|(*args), memo_obj|...} -> obj
# each_with_object(obj) -> an_enumerator

# Iterates the given block for each element with an arbitrary object given, and returns the initially given object
# If no block is given, returns an enumerator.

# EXAMPLE from Ruby Doc:
even = (1..10).each_with_object([]) {|num, array| array << num*2 }
#=> [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

# EXAMPLE from LS - array:
[1,2,3].each_with_object([]) do |num, array|
  array << num if num.odd?
end
# => [1,3]

# In the above example, array is initialized to an empty array, [].
# Inside the block array is manipulated. Appending the current num into it if it's odd.

# EXAMPLE from LS - array:
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
# => ["ant", "bear", "cat"]

# It's also possible to capture key-vale pair as the value to be enumerated upon

# EXAMPLE from LS - hash:
{ a: "any", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
# => { "ant" => :a, "bear" => :b, "cat" => :c }

########################## Enumerable#first
# Does not take a block, but has an optional argument.
# The optional argument represents the number of elements to return.

# first -> obj or nil
# Returns the first element, or first n elements, of the enumerable. 
# If the enumerable is empty, the first form returns nil, and the second form returns an empty array.

# EXAMPLE from Ruby Doc:
%w(foo bar baz).first # => "foo"
%w(foo bar baz).first(2) # => ["foo", "bar"]
%w(foo bar baz).first(10) # => ["foo", "bar", "baz"]
[].first # => nil
[].first(2) # => []

# EXAMPLE from LS - array:
[1,2,3].first # => 1

# EXAMPLE from LS - hash:
{ a: "ant", b: "bear", c: "cat" }.first(2)
# => [[:a, "ant"], [:b, "bear"]]

# 1) Usually hashes are unordered, so it's weird that first can be called. But Ruby stores the order, and returns a nested array.
# 2) You can turn the nested array back into a hash by using to .to_h array method.

########################## Enumerable#include?
# Does not take a block, but requires one argument.
# It returns true if the argument exists in the collection and false if it doesn't.

# include?(obj) -> true or false
# Returns true if any member of enum equals obj. Equality is tested using ==.

# EXAMPLE from Ruby Doc:
IO.constants.include? :SEEK_SET          #=> true
IO.constants.include? :SEEK_NO_FURTHER   #=> false

# EXAMPLE from LS - array:
[1,2,3].include?(1)
# =>  true

# EXAMPLE from LS - hash:
{ a: "ant", b: "bear", c: "cat" }.include?("ant")
# => false

{ a: "ant", b: "bear", c: "cat" }.include?(:a)
# => true

# include? for hash only checks the keys, not the values.
# hash#include? is essentially an alias for hash#key? or hash#has_key?.

########################## Enumerable#partition
# Divides up elements in the current collection into two collections.
# Depends on block's return value.

# partition {|obj| block} -> [true_array, false_array]
# partition -> an_enumerator
# Returns two arrays, the first containing the elements of enum for which the block evaluates to true.
# The second containing the rest.
# If no block is given, an enumerator is returned instead.

# EXAMPLE from Ruby Doc:
(1..6).partition {|value| value.even?} # => [[2,4,6], [1,3,5]]

# EXAMPLE from LS - array:
[1,2,3].partition {|num| num.odd? }
# => [[1,3], [2]]

# BEST USE CASE from LS - Parallel Assign Variables:
odd, even = [1,2,3].partition do |num|
  num.odd?
end

odd # => [1,3]
even # => [2]

# EXAMPLEfrom LS - hash:
long, short = {a: "ant", b: "bear", c: "cat"}.partition do |key, value|
  value.size > 3
end
long # => [[:b, "bear"]] 
short # => [[:a, "ant"], [:c, "cat"]] 

# Method Documentation will normally include:
  # => One or more method signatures (which will indicate whether the method takes arguments and/ or a block and what it returns)
  # => A brief description of how the method is used, often covering different use cases
  # => Some code examples, again usually covering various use cases

# Look out for:
  # => Whether the method takes a block
  # => How it handles the block's return value
  # => What the method itself returns
  




