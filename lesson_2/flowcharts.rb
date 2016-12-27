# ~*~*~*~~*~*~*~*~*~*~*~*~*~*~~~~~* FLOWCHARTS *~~~~~*~*~*~*~~*~*~*~*~*~*~*~*~*~* # 

# Flowchart helps us map out the logical sequence of a possible solution in a visual way.

# Flowchat Components
  # OVAL - start and stop
  # RECTANGLE - processing step
  # PARALLELOGRAM - input / output
  # DIAMOND - decision (2 max)
  # CIRCLE - connector
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

#####################################################################################################################################################################
# EXAMPLE - Formal Pseudo-Code to Flowchart - for a method that determines which number is greatest in a collection

OVAL - START

# Given a collection of integers called "numbers"

RECTANGLE
  SET iterator = 1
  SET saved_number = value within numbers collection at space 1

CIRCLE 

DIAMOND
WHILE iterator < length of numbers
  
  DIAMOND
  SET current_number = value within numbers collection at space "iterator"
  IF saved_number >= current_number
    go to the next iteration
  ELSE
    
    RECTANGLE
    saved_number = current_number

CIRCLE

RECTANGLE
  iterator = iterator + 1

PRINT saved_number

END
##################################################################################################################################################################### 

# IMPERATIVE or PROCEDURAL problem solving is mapping step-by-step logic out in the flowchart
# DECLARATIVE is when we abstract the logic to a method, thus not having to explain each step of the computer's logic

# ~*~*~*~~*~*~*~*~*~*~*~*~*~*~~~~~* LARGER PROBLEMS *~~~~~*~*~*~*~~*~*~*~*~*~*~*~*~*~* # 

# Now, let's suppose that the above flowchart is mapping out a solution to part of a larger problem. Let's suppose that in our larger problem, we're asking the user to give us N collections of numbers. 
# We want to take the largest number out of each collection, and display it.

##################################################################################################################################################################### 
# EXAMPLE - High Level Pseudo-code - We want to take the largest number out of each collection, and display it.
while user wants to keep going
    - ask the user for a collection of numbers
    - extract the largest one from that collection and save it
    - ask the user if they want to input another collection
return saved list of numbers
##################################################################################################################################################################### 

# "extract the largest one from that collection and save it" is a sub-process itself, requiring more writing:

##################################################################################################################################################################### 
# EXAMPLE - High Level Pseudo-code - We want to take the largest number out of each collection, and display it also expanding on extracting the largest.
while user wants to keep going
  - ask the user for a collection of numbers
  - iterate through the collection one by one
    - save the first value as the starting value.
    - for each iteration, compare the saved value with the current value
    - if the saved value is greator, or equal to
      - move to the next value in the collection
    - otherwise, if the current value is greater
      - reassign the saved value as the current value

  - after iterating through the collection, save the largest value into the list
  - ask the user if they want to input another collection

return saved list of numbers
##################################################################################################################################################################### 

# When pseudo-code gets long, it becomes very hard to trust the accuracy of the logic (remember, you can only verify the logic by running actual program code).
# Therefore, it's prudent to extract a logical grouping into a sub-process, and to tackle the various pieces separately.

##################################################################################################################################################################### 
# EXAMPLE - Formal Pseudo-code - We want to take the largest number out of each collection, and display it.
START 

SET large_numbers = []
SET keep_going = turn

WHILE keep_going == true
  GET "enter a collection"
  SET collection
  SET largest_number = SUBPROCESS "extract the largest one from that collection"
  large_numbers.push(largest_number)
  GET "enter another collection?"
  SET answer
  IF answer == "yes"
    keep_going = true
  ELSE
    keep_going = false
  IF keep_going == false
    exit loop

PRINT large_numbers

END
##################################################################################################################################################################### 

# Extracting to sub-processes helps us focus on a well defined narrowly scoped set of pseudo-code.

# Interestingly, when we move logic to sub-processes, we are able to use a declarative type of syntax, rather than imperative.

# STEP ONE: High Level Pseudo-code
# Start at a high level, using declarative syntax. For example, if you're working on a calculator, you can start with something like this:
- Get the first number
  - Make sure its valid, otherwise, ask for another
- Get the second number
  - Make sure its valid, otherwise, ask for another
- Get the operator
  - Make sure its valid, otherwise, ask again

- Perform operation on the two numbers
- Display result
- Ask if user wants to do another calculation

# STEP TWO: Move closer to Imperative
# In the above, you're not yet outlining exactly how to validate the inputs. 
# No specifics or imperative style pseudo-code yet. 
# Once you have the high level steps, it's time to drill down a level into imperative pseudo-code and outline specifics.


