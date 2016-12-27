# Pseudo-code is meant for humans to read. It's not meant for machines orprograms to process.

#####################################################################################################################################################################
# EXAMPLE - Pseudo-Code - for a method that determines which number is greatest in a collection

Given a collection of integers.

Iterate through the collection one by one
  - save the first value as the starting value.
  - for each iteration, compare the saved value with the current value
  - if the saved value is greater, or it''s the same
    - move to the nedxt value in the collection
  - otherwise, if the saved current value is greater
    - reassign the sdaved value as the current value

After iterating through the collection, return the saved value.

#####################################################################################################################################################################

# Pseudo-code helps us load the problem into the brain first before trying to tackle it in code

# Two layers of problem solving:
  # 1) Logical Problem Domain Layer
  # 2) Syntactical Programming Language Layer

# Pseudo-code helps us focus on the logical problem domain layer, without dragging us down to the programming language layer.
# The problem with pseudo-code is that we cannot verify its logic.

# ~*~*~*~~*~*~*~*~*~*~*~*~*~*~~~~~* FORMAL PSEUDO-CODE *~~~~~*~*~*~*~~*~*~*~*~*~*~*~*~*~* # 
# Formal pseudo-code is translatable to all programming languages:

KEYWORD - meaning
START - start of the program
SET - sets a variable we can use later
GET - retrieve input from user
PRINT - displays output to user
READ - retrieve value from variable
IF / ELSE IF / ELSE  - shows conditional branches in logic
WHILE - show looping logic
END - end of program

#####################################################################################################################################################################
# EXAMPLE - Pseudo-Code TO Formal Pseudo-Code - for a method that determines which number is greatest in a collection

START

# Given a collection of integers called "numbers"

SET iterator = 1
SET saved_number = value within numbers collection at space 1

WHILE iterator < length of numbers
  SET current_number = value within numbers collection at space "iterator"
  IF saved_number >= current_number
    go to the next iteration
  ELSE
    saved_number = current_number

  iterator = iterator + 1

PRINT saved_number

END
#####################################################################################################################################################################
# Still need to test logic, but this is more organized and sound than the informal pseudo-code

# ~*~*~*~~*~*~*~*~*~*~*~*~*~*~~~~~* TRANSLATING PSEUDO-CODE TO PROGRAM CODE *~~~~~*~*~*~*~~*~*~*~*~*~*~*~*~*~* # 

#####################################################################################################################################################################
# EXAMPLE - Formal Pseudo-Code TO Ruby Code - for a method that determines which number is greatest in a collection
def find_greatest(numbers)
  saved_number = nil

  numbers.each do |num|
    saved_number ||= num # assign to first value
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end

  saved_number
end
#####################################################################################################################################################################
# Now that the program is at the code level and works we can improve the code

# For larger problems you want to break it up, and use pseudo-code on parts of the problem then check its logic.
# You don't want to solve a large problem with pseudo-code just to see that there's a flaw in the logic somewhere, thus forcing you to rewrite.
# Pseudo-code is a guess at the solution and there's no verification that the logic is correct.

# ~*~*~*~~*~*~*~*~*~*~*~*~*~*~~~~~* PRACTICING PSEUDO-CODE *~~~~~*~*~*~*~~*~*~*~*~*~*~*~*~*~* # 

# 1. a method that returns the sum of two integers
# ANSWER: CASUAL PSEUDO-CODE
Given two integers

Get the two integer values
Add the first integer to the second integer
Save the results in a variable
Return the value of the results

# ANSWER: FORMAL PSEUDO-CODE
START
# given two integers
GET integer value one
SET num1 = integer value one

GET integer value two
SET num2 = integer value two

SET result = num1 + num2 to add the two integer values together

PRINT result to return the sum of the values

# 2. a method that takes an array of strings, and returns a string that is all those strings concatenated together
# ANSWER: CASUAL PSEUDO-CODE
Given an array of strings

Iterate over the array of strings
  -Take the value of the first string and put it in a variable
  -Add the next value of the array to the new variable 
  -Repeat until the array is empty

Return the variable with the concatenated strings

# ANSWER: FORMAL PSEUDO-CODE
START 

# Given a collection of strings

SET iterator = 1

WHILE iterator < range of values in collection
  SET concatenated_strings = value of first string
  IF array value is empty
    PRINT concatenated_strings
  ELSE
    continue to add values from array into concatenated_strings

  iterator = iterator + 1

PRINT concatenated_strings

END

# 3. a method that takes an array of integers, and returns a new array with every other element
# ANSWER: CASUAL PSEUDO-CODE
Given an array of integers

Iterate over the array of integers
  -create a variable to store other elements
  -create another variable to store which index of the array you are on
  -for each iteration check every other element
    -take that element and store it in the variable
  -if there are no more elements to check then exit out the loop

After iterating through the array, return the stored element variable

# ANSWER: FORMAL PSEUDO-CODE
START

#Given an array of integers

SET iterator = 1
SET index = 0

SET empty_array = an empty array for storing every other element

WHILE iterator < length of numbers
  IF index value is odd
    store value in the empty_array
  ELSE
    go to next iteration

  iterator = iterator + 1
  index = index + 1

PRINT empty_array

END
  














