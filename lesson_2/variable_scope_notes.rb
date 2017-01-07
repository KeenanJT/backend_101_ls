# ~*~*~*~~*~*~*~*~*~*~*~*~*~*~~~~~* Variable Scope *~~~~~*~*~*~*~~*~*~*~*~*~*~*~*~*~* # 

# A variable's scope determines where in a program a variable is available for use.
# A variable's scope is defined by where the variable is initialized or created.
  # In Ruby, variable scope is defined by a block, or a piece of code following a method invocation. ex: { } or do/end

# RULE 1: Inner scope can access (local) variables initialized in an outer scope, but not vice versa. With Blocks.
# EX 1 - Outer vs Inner Scope ################################################################################################################################################################
a = 5 # variable is initialized in the outer scope

3.times do |n|
  a = 3 # is a accessible in the inner scope?
end

puts a # ANSWER: outputs 3, because a is available to the inner scope. a is essentially reassigned 3 times to 3.

# EX 2 - Inner vs Outer Scope ################################################################################################################################################################
a = 5

3.times do |n|
  a = 3
  b = 5 # b is initialized in the inner scope
end

puts a
puts b # is b accessible in the outer scope?

# ANSWER: No it isn't, because b has been initialized in the inner scope, thus not existing in the outer scope.
# This will throw a NameError.

# ~*~*~*~~*~*~*~*~*~*~*~*~*~*~~~~~* Variables and Blocks *~~~~~*~*~*~*~~*~*~*~*~*~*~*~*~*~* # 

# Blocks create new scope for local variables. 
# Scope created by a block is called an inner scope.
# Nested blocks will create nested scopes.
# Variable's scope is determined by where it is initialized

# EX 1 - Outer Scope Variables Can Be Accessed By Inner Scope ###################################################################################################################################
a = 1         # outer scope variable

loop do       # the block creates an inner scope
  puts a      # => 1
  a = a + 1   # "a" is re-assigned to a new value
  break       # necessary to prevent inifinte loop
end

puts a        # => 2 "a" was re-assigned in the inner scope

# Inner scope can access outer scope variables (value of a changing from 1 to 2)
# You can change variables from an inner scope and have that affect the outer scope (a = a + 1)

# EX 2 - Inner Scope Variables Cannot Be Accessed In Outer Scope ###################################################################################################################################
loop do       # the block creates an inner scope
  b = 1
  break
end

puts b        # => NameError: undefined local variable or method 'b' for main:Object

# Main is the outer scope and does not have a b variable. Where a variable is initialized determines its scope.
# "b" is initialized in an inner scope.

# EX 3 - Peer Scopes Do Not Conflict ################################################################################################################################################################
2.times do
  a = 'hi'
  puts a      # 'hi' <= this will be printed out twice due to the loop
end

loop do
  puts a      # => NameError: undefined local variable or method 'a' for main:Object
  break
end

puts a        # => NameError: undefined local variable or method 'a' for main:Object

# a = 'hi' is scoped within the first block of code.
# Peer blocks cannot reference variables initialized in other blocks.

# EX 4 - Nested Blocks ##############################################################################################################################################################################
# Nested follow the same rules as Inner vs Outer. We can name them based on their "levels"
a = 1         # first level variable

loop do
  b = 2       # second level 

  loop do
    c = 3     # third level
    puts a    # => 1
    puts b    # => 2
    puts c    # => 3
    break
  end

  puts a      # => 1
  puts b      # => 2
  puts c      # => NameError
  break
end

puts a        # => 1
puts b        # => NameError
puts c        # => NameError

# EX 5 - Variable Shadowing #########################################################################################################################################################################
# DEFINITION: When the variable name of both the outer and inner scope is the same, \n
# thus two local variables in the inner scope have the same name.
# The outer scope local variable is then prevented.
n = 10
[1,2,3].each do |n|
  puts n      # uses the block "n", not the outer scope lcoal variable "n"
end

# Variable shadowing prevents us from making changes to the outer scoped n

n = 10

1.times do |n|
  n = 11
end

puts n        # => 10

# Variable shadowing is confusing when you're coding as it can cause unknown problems. 
# Choose long and descriptive variable names

# ~*~*~*~~*~*~*~*~*~*~*~*~*~*~~~~~* Variables and Methods *~~~~~*~*~*~*~~*~*~*~*~*~*~*~*~*~* # 

# Method scope is entirely self contained.
# Methods have no notion of outer or inner scope when it comes to local variables.
# You must explicitly pass in any parameters to methods.

# EX 1 - Methods Can't Access Variables In Another Scope #############################################################################################################################################
a = 'hi'

def some_method
  puts a
end

some_method # => NameError

# EX 2 - Methods Can Access Objects Passed In
def some_method(a)
  puts a
end

some_method(5) # => 5

# You must pass in local variables to methods.

# ~*~*~*~~*~*~*~*~*~*~*~*~*~*~~~~~* Blocks within Methods *~~~~~*~*~*~*~~*~*~*~*~*~*~*~*~*~* # 
# The rules are the same for block scope in a method

def some_method
  a = 1         # called in outer scope in the method
  5.times do
    puts a
    b = 2       # called in the inner scope of the block within the method
  end

  puts a
  puts b        # will not have an output as it was not called in the outer scope
end

some_method     # => NameError for 'b'

# ~*~*~*~~*~*~*~*~*~*~*~*~*~*~~~~~* Constants *~~~~~*~*~*~*~~*~*~*~*~*~*~*~*~*~* # 
# Behave as global variables as they can leak into methods and blocks

# EX 1 - Calling Constant In A Method #############################################################################################################################################
USERNAME = 'Batman'

def authenticate
  puts "Logging in #{USERNAME}"
end

authenticate      # => Logging in Batman

# EX 2 - Calling Constant In A Block #############################################################################################################################################
FAVORITE_COLOR = 'taupe'

1.times do
  puts "I love #{FAVORITE_COLOR}!"  # => I love taupe!
end

# EX 3 - Initializing Constant In Inner Scope, Using In Outer #############################################################################################################################################
loop do
  MY_TEAM = "Phoenix Suns"
  break
end

puts MY_TEAM  # => Phoenix Suns
