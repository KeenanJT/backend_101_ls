################################## Collections: Sorting
# Learned how to iterate, select, and transform collections.
# Sorting is mostly performed on arrays sine they're index based
  # => Strings don't have access to sorting methods. Instead convert them to arrays
  # => Hashes are ordered in Ruby, but it's best to utilize their key

################################## What is sorting?
# Sorting is setting the order of the items in a collection according to a certain criteria.
# Ruby has two methods: sort and sort_by. Both return a new array

# EXAMPLE - Using Sort on Integer: Numeric Order
[2, 5, 3, 4, 1].sort # => [1,2,3,4,5]

################################## Comparison at the heart of sorting
# Sorting is essentially carried out by comparing the items in a collection with each other, and ordering them based on teh result of that comparison.

# EXAMPLE - Sorting Alphabetically
['c', 'a', 'e', 'b', 'd'].sort # => ['a','b','c','d','e']

# sort uses the <=> method to compare each element in the array to each other.
# The <=> (comparison operator) method performs compariosn between two of the same objects, returning 1, 0, -1, and nil.
  # 1 = first object is higher than the second object; 'b' <=> 'a' # => 1
  # 0 = first and second object are the same; 'a' <=> 'a' # => 0
  # -1 = first object is lower than second object; 'a' <=> 'b' # => -1
  # nil = objects are not of the same type; 1 <=> 'one' # => nil then throws ArgumentError

# sort method just cares about the return value of <=>: 1,0,-1, or nil.

# Sorting collections that contain certain types of objects require two things:
  # 1) Does the object type implement a <=> comparison method?
  # 2) If yes, what is the specific implementation of that method for that object type?
    # => String#<=> uses ASCII to organize string values

# String#<=>: string <=> other_string → -1, 0, +1 or nil
# Comparison—Returns -1, 0, +1 or nil depending on whether string is less than, equal to, or greater than other_string.
# nil is returned if the two values are incomparable.
# If the strings are of different lengths, and the strings are equal when compared up to the shortest length, then the longer string is considered greater than the shorter one.
# <=> is the basis for the methods <, <=, >, >=, and between?, included from module Comparable. The method String#== does not use Comparable#==.
  # ASCII RULES:
    # => Uppercase letters come before lowercase letters
    # => Digits and most punctuation come before letters
    # => Accented and other characters come after main ASCII table

# EXAMPLES - From Ruby Doc
"abcdef" <=> "abcde"     #=> 1
"abcdef" <=> "abcdef"    #=> 0
"abcdef" <=> "abcdefg"   #=> -1
"abcdef" <=> "ABCDEF"    #=> 1
"abcdef" <=> 1           #=> nil

## The sort method ##
# sort can also have a block, but it always has to return the value of <=>
# EXAMPLE - sort block - ascending order
[2,5,3,4,1].sort do |a, b|
  a <=> b
end
# => [1,2,3,4,5]

# EXAMPLE - sort block - descending order
[2,3,5,4,1].sort do |a, b|
  b <=> a
end
# => [5,4,3,2,1]

# Challenge: What will the follow sort to?:
['arc', 'bat', 'cape', 'ants', 'cap'].sort
# Answer: # => ['ant', 'arc', 'bat', 'cap', 'cape']
# 'cape' is last compared to 'cap', because it has more letters

# Challenge: What will the follow sort to?:
[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
# Answer: # => [["a", "car", "d"], ["a", "car", "d", 3], ["a", "cat", "b", "c"], ["b", 2]]
# When there's nested arrays the Array#<=> will compare each first element then sort then check the second element.

## The sort_by method ##
# Similar to sort, but usually uses a block that determines how the items are compared.

# EXAMPLE - using sort_by
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end
# => ["mat", "bed", "cot"]

# A great usecase would be to sort hashes by their values

# EXAMPLE - sorting a hash with sort_by
people = { Kate: 27, john: 25, Mike: 18 }

people.sort_by do |name, age|
  age
end
# => [[:Mike, 18], [:john, 25], [:Kate, 27]]

# The problem: how do we sort the hash by names?
  # => Lowercase j in john
  # => Names are all symbols, but using Symbol#<=> you'll see it turns them into strings
    # => String#<=> follows the ASCII rules
# Solution:

people.sort_by do |name, age|
  name.capitalize
end
# => [[:john, 25], [:Kate, 27], [:Mike, 18]]


