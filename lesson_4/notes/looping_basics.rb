################ Looping ################
# To perform an action on many, if not all, of the elements in a collection.
# EX:
arr = [1, 2, 3, 4, 5]
counter = 0

loop do
  arr[counter] += 1
  counter += 1
  break if counter == arr.size
end

arr # => [2, 3, 4, 5, 6]

################ Controlling a Loop ################
# Simple Loop with loop do
loop do
  puts 'Hello!'
  break
end
# needs break to break out of the loop

# A little more complex loop do with a conditional for the break
loop do
  number = rand(1..10)   # a random number between 1 and 10
  puts 'Hello!'
  break if number == 5
end

################ Iteration ################
# In order to align the value of counter and the number of iterations, we need to increment counter by 1 during each iteration. 
# This will ensure that loop only iterates five times.
# EX:
counter = 0

loop do
  puts 'Hello!'
  counter += 1
  break if counter == 5
end

################ Break Placement ################
# do/while behavior loop do is when the break is at the last line. 
# the code within the block is guaranteed to execute at least once.
counter = 0

loop do
  puts 'Hello!'
  counter += 1
  break if counter == 5
end

# while loop behavior with loop do:
# If we move break to the first line within the loop, this will then mimic the behavior of a while loop. 
# The while keyword always precedes a condition. 
# If the condition evaluates to true, the loop will execute the code within the block. 
# If the condition evaluates to false, the loop will stop. 
# This means the code below break may or may not execute at all, depending on the condition.
counter = 0

loop do
  break if counter == 0
  puts 'Hello!'
  counter += 1
end

################ Next ################
# When next is executed, it tells the loop to skip the rest of the current iteration and begin the next one.
counter = 0

loop do
  counter += 1
  next if counter.odd?
  puts counter
  break if counter > 5
end

################ Iterating Over Collections ################
############ String
alphabet = 'abcdefghijklmnopqrstuvwxyz'
counter = 0

loop do
  break if counter == alphabet.size
  puts alphabet[counter]
  counter += 1
end

############ Array
colors = ['green', 'blue', 'purple', 'orange']
counter = 0

loop do
  break if counter == colors.size
  puts "I'm the color #{colors[counter]}!"
  counter += 1
end

############ Hash
number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}
pets = number_of_pets.keys # => ['dogs', 'cats', 'fish']
counter = 0

loop do
  break if counter == number_of_pets.size
  current_pet = pets[counter]
  current_pet_number = number_of_pets[current_pet]
  puts "I have #{current_pet_number} #{current_pet}!"
  counter += 1
end
