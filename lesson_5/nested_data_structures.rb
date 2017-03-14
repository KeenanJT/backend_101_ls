################################### Nested Data Structures
# Nested is when a collection contains another collection

########## Reference Collection Elements ##########

# EXAMPLE - Nested Array
arr = [[1,3], [2]]
# Each element has an index. [1,3] is index 0, [2] is index 1. Inner array has the same indexing [1,3] has 0 and 1.
arr[0] # => [1,3]
arr[0][0] # => 1

########## Updating Collection Elements ##########

# Remember how arrays can be updated?
arr = [[1,3], [2]]
arr[1] = "hi there" # this is a destructive action
arr # => [[1,3], "hi there"]

# EXAMPLE - Modifying value in a nested array
arr = [[1,3], [2]]
arr[0][1] = 5 # arr[0] references the inner array then [1.3][1] = 5 is called and the element is changed to 5

arr # => [[1,5], [2]]

# EXAMPLE - Inserting into inner array
arr = [[1], [2]]
# arr[0] is element referencing
arr[0] << 3
# [1] << 3 is element updating and it's destructive
arr # => [[1,3], [2]]

########## Other Nested Structures ##########

# EXAMPLE - Nested Hash
arr = [{ a: 'ant' }, { b: 'bear' }]
# Index of the first hash is 0 and second is 1
# This is how to add another key/value pair to one of the hashes
arr[0][:c] = 'cat'
arr # => [{ :a => "ant", :c => "cat" }, { :b => "bear" }]

arr = [['a', ['b']], { b: 'bear', c: 'cat' }, 'cab']
arr[0]       # => ['a', ['b']]
arr[0][1][0] # => "b"
arr[1]       # => { b => "bear", c => "cat" }
arr[1][:b]   # => "bear"
arr[1][:b][0]# => "b"
arr[2][2]    # => "b"

########## Variable Reference For Nested Collections ##########

# Variables can reference inner collections
a = [1,3]
b = [2]
arr = [a, b] # => [[1,3], [2]]

# When you change something in the variable it'll affect the array, vice versa.
# EXAMPLE - Change pointer variable to change array
a[1] = 5
arr # => [[1,5], [2]]

# EXAMPLE - Change array to affect pointer variable
arr[0][1] = 8
a # => [1,8]

########## Shallow Copy ##########

# Copying an entire collect by using dup and clone
# Shallow copy means that only the object that the method is called on is copied while the elements are shared.

# EXAMPLE - dup - changing the shared elements
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!
arr2 # => ["a", "B", "c"]
arr1 # => ["a", "B", "c"]

# EXAMPLE - clone - changing the shared elements
arr1 = ["abc", "def"]
arr2 = arr1.clone
arr2[0].reverse!
arr2 # => ["cba", "def"]
arr1 # => ["cba", "def"]

# EXAMPLE - dup - changing the copied array doesn't affect the original array
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char| # making changes to the array, not the elements
  char.upcase #non destructive, thus doesn't affect original array
end
arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]

# EXAMPLE - dup - changing the element in the copied array affects the original array
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
  char.upcase! # destructive method that will affect the shared elements
end
arr1 # => ["A", "B", "C"]
arr2 # => ["A", "B", "C"]

########## Freezing Objects ##########
# Main difference between dup and clone is that clone preserves the frozen state of the object

# Freezing is turning a mutable object immutabl i.e. strings, and arrays, but not numbers.
# It only freezes the object it's called on.

# EXAMPLE - frozen outer array, unfrozen inner arrays
arr = [[1], [2], [3]].freeze
arr[2] << 4
arr # => [[1], [2], [3, 4]]

# EXAMPLE - clone - maintains frozen state and gives RuntimeError
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.clone
arr2 << "d"
# => RuntimeError: can't modify frozen Array

# EXAMPLE - dup - does not maintain frozen state, and changes the copied array
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup
arr2 << "d"
arr2 # => ["a", "b", "c", "d"]
arr1 # => ["a", "b", "c"]








