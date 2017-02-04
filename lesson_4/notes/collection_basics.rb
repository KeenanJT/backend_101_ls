############### Collection Basics #####################
# Collections are made up of individual elements. 
# Main things to learn when dealing with collections: Structure, Reference, and Assignment

############### Element Reference #####################

############### String Element Reference

# String use an integer-based index that represents each character in the string. It starts at zero and increments by one.

# EX - slice method - slice(index) → new_str or nil - Index with String
str = 'abcdefghi'
str[2] # => "c"

# EX - slice method - slice(start, length) → new_str or nil - Referencing Multiple Characters [starting point, number of characters to return (stars with the starting point)]
str[2, 3] # => "cde"

# Method chaining - when we call another method on the return value of the other method.

# EX - Method Chaining
str[2, 3][0] # => "c"
# The intial slice returns a string that we chain with another slice

# PRACTICE - How would you reference 'grass' from within this string?

str = 'The grass is green'

str[4, 5] # => "grass" 
str.slice(4, 5) # => "grass" 

############### Array Element Reference

# Like strings, arrays are also ordered, zero-index collections
# Arrays are lists of elements that are ordered by index, where each element can be any object.
# slice(index) → obj or nil
# slice(start, length) → new_ary or nil

# EX - Array Slicing
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']

arr[2] # => "c"

# PRACTICE - What do you think would be returned here?
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']

arr[2, 3] # => ['c', 'd', 'e']
# Above is the array slice method
arr[2, 3][0] # => "c" 
# Above is the Array slice method that is chained with the String slice method

# EX - Array slice examples
arr = [1, 'two', :three, '4']
arr[3] # => "4"
arr[3, 1] # => ["4"]

############### Hash Element Reference
# Collection data structure that uses key-value pairs, instead of intger-based index.

# EX - Hash and slicing
hsh = {'fruit' => 'apple', 'veg' => 'carrot'}

hsh['fruit'] # => "apple"
# To grab the value you call the key

hsh['fruit'][0] # => "a"
# this is method chaining, first is hash slice then string slice

# **** Keys must be unique in a hash, but the value does not have to be
# EX - Key Duplication
hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }

(irb):1: warning: key :fruit is duplicated and overwritten on line 1
=> {:fruit=>"pear", :vegetable=>"carrot"}

# The first one is over-written by the third as they have identical keys.

# Values can be duplicated
hsh = { 'apple' => 'fruit', 'carrot' => 'vegetable', 'pear' => 'fruit' }

# We can access only the keys and or values with a method
country_capitals = { uk: 'London', france: 'Paris', germany: 'Berlin' }
country_capitals.keys      # => [:uk, :france, :germany]
country_capitals.values    # => ["London", "Paris", "Berlin"]
country_capitals.values[0] # => "London"

############### Element Reference Gotchas #####################
# There are a few things that can catch you off guard when referencing elements in a collection
# and you need to be aware of these in order to avoid unintended behavior in your code.

############### Out of Bound Indices
# Since strings and arrays are indexed collections, what happens when you go out of bounds?

# EX - Out of Bounds Indices
str = 'abcde'
arr = ['a', 'b', 'c', 'd', 'e']

str[5] # => nil
arr[5] # => nil

# It returns nil.
# The issue isn't as much for Strings as it is for Arrays.
# The problem is that nil can be an element inside of an Array.
# How do you know if it's an element in the collection type Array or actually out of bounds?

# EX - Out of Bounds and Element in Array
arr = [3, 'd', nil]
arr[2] # => nil
arr[3] # => nil

# fetch method - Tries to return the element at position index, but throws an IndexError exception if the referenced index lies outside of the array bounds
# => fetch(index) → obj click to toggle source
# => fetch(index, default) → obj
# => fetch(index) { |index| block } → obj 

# EX - Out of Bounds and Element in Array caught with fetch
arr.fetch(2) # => nil
arr.fetch(3) # => IndexError: index 3 outside of array bounds: -3...3
             #        from (irb):3:in `fetch'
             #        from (irb):3
             #        from /usr/bin/irb:11:in `<main>'

############### Negative Indices
# what happens when you use an index less than 0?
# EX - Index Less than 0
str = 'abcde'
arr = ['a', 'b', 'c', 'd', 'e']

str[-2] # => "d"
arr[-2] # => "d"

# PRACTICE - What do you think would be returned by the following calls?
str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

str[-6] # => nil
arr[-6] # => nil
# arr.fetch(-6) # => IndexError

############### Out of Bound Indices
# Hash also has a #fetch method which can be useful when trying to disambiguate valid hash keys with a nil value from invalid hash keys.

hsh = { :a => 1, 'b' => 'two', :c => nil }

hsh['b']       # => "two"
hsh[:c]        # => nil
hsh['c']       # => nil
hsh[:d]        # => nil

hsh.fetch(:c)  # => nil
hsh.fetch('c') # => KeyError: key not found: "c"
               #        from (irb):2:in `fetch'
               #        from (irb):2
               #        from /usr/bin/irb:11:in `<main>'
hsh.fetch(:d)  # => KeyError: key not found: :d
               #        from (irb):3:in `fetch'
               #        from (irb):3
               #        from /usr/bin/irb:11:in `<main>'

############### Conversion #####################
# String and Array share zero-indexed collection styles, thus can easily be converted to one another.

# String#chars - returns an array of individual characters.
str = 'Practice'

arr = str.chars # => ["P", "r", "a", "c", "t", "i", "c", "e"]

# Array#join - returns a string with the elements of the array joined together.
arr.join # => "Practice"

# String#split - returns an array of words default split by space between the words.
str = 'How do you get to Carnegie Hall?'
arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
arr.join        # => "HowdoyougettoCarnegieHall?"
arr.join(' ') # => 'How do you get to Carnegie Hall?'

# #to_a - hash to turn into an array
hsh = { sky: "blue", grass: "green" }
hsh.to_a # => [[:sky, "blue"], [:grass, "green"]]

# #to_h - array return a hash
arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]
arr.to_h # => { :name => "Joe", :age => 10, :favorite_color => "blue" }

############### Element Assignment #####################
############### String Element Assignment
# You can use the index of a string to change its value.
# Index value changing is desctructive on the reciever.
str = "joe's favorite color is blue"
str[0] = 'J'
str # => "Joe's favorite color is blue"

############### Array Element Assignment
# Similar to how we can assign individual characters in a string using their index, we can assign elements of an array in the same way.
arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr         # => [2, 2, 3, 4, 5]

############### Hash Element Assignment
hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh # => { :apple => "Fruit", :carrot => "Produce", :pear => "Produce", :broccoli => "Produce" }