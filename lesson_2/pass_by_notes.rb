# ~*~*~*~*~* PASS BY REFERENCES vs PASS BY VALUE *~*~*~*~*~*~
# The discussion stems from trying to determine what happens to objects when passed into methods.
  # => Two ways of dealing with objects passed into methods
    # => 1) Argument is a reference to the original object
    # => 2) Argument is a value or copy of the original object

# ~*~*~*~*~* What Does Pass By "Value" Mean? *~*~*~*~*~*~
# Passing by the value is just making a copy in the method, thus not changing the original object
# The object or local variable om main() is not affected by the method

# EXAMPLE - Pass By Value Method *****************************************************************
def change_name(name)
  name = 'bob'        # does this reassignment change the object outside the method?
end

name = 'jim'
change_name(name)
puts name             # => jim
# Since assignment (=) is not a mutating or destructive method, the original object or argument was only
# changed in the local scope of the method, but not on main()

# ~*~*~*~*~* What Does Pass By "Reference" Mean? *~*~*~*~*~*~
# When the caller is mutated it is a pass by reference method.

# EXAMPLE - Pass By Reference Method *****************************************************************
def cap(string)
  string.capitalize!  # => does this affect the object outside the method?
end

name = 'jim'
cap(name)
puts name             # => Jim - main's local variable name has been changed. The method is desctructive, this using a reference instead of a copy

# ~*~*~*~*~* What Ruby Does... *~*~*~*~*~*~
# Ruby has both pass by reference and value
# This is called "pass by reference of the value" or "call by sharing"
# Make sure to check if the method is destructive or not, basically if it mutates the caller or not

# EXAMPLE - Destructive Method *****************************************************************
def add_name(arr, name)
  arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect    # => ['bob', 'kim', 'jim']
# << or shovel is a desctrutive method on arrays, thus changing the caller in the above example

# EXAMPLE - Non-Destructive Method *****************************************************************
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim') # => ['bob', 'kim', 'jim']
puts names.inspect     # => ['bob', 'kim']
# + is non-destructive, but is used to concatenate two arrays, and returns a new array.
# if a method returns something that's new then it most likely isn't mutating

# ~*~*~*~*~* Variables as Pointers *~*~*~*~*~*~
# Variables are pointers to physical places or addresses in memory on a computer.
# EX - Value Changes - Different Addresses
a = 'hi there'
b = a
a = 'not here'

puts a  # => 'not here'
puts b  # => 'hi there'

# EX 2 - Reference Changes
a = 'hi there'
b = a
a << ', Bob'

puts a # => 'hi there, Bob'
puts b # => 'hi there, Bob'

# Some operations will mutate the actual address space in memory, affecting all variables that point to that address
# Other operations will not mutate the address space in memory, and instead will re-point the variable to a new address space in memory.

# Mutating the caller - changes the value in the address space, thus any variable pointing to it will be affected
