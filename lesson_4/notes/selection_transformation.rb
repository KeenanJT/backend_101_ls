########################### Selection and Transformation ###########################
=begin 
*DEF:: Selection - picking certain elements out of the collection depending on some criteria.
Selection uses CRITERIA to determine which elements are selected.
Example of Selection - picking all odd integers from an array.

*DEF:: Transformation - manipulating every element in the collection.
Transformation uses CRITERIA to determine how to perform the transformation.
Example of Transformation - incrementing all elements of the array by 1.

If n elements exist in a collection, SELECTION results in n or less elements, while TRANSFORMATION
always results in exactly n elements.

They BOTH utilize the basics of loop:
1) A loop (loop do, for, while, do/while)
2) A counter (used to break the loop, and iterate through the collection)
3) A way to retrieve the current value (local variable in the loop that extracts the value from the iterated collection)
4) A way to exit the loop (utilizing a break if with the counter equalling the size of the collection)
=end

########################### Looping to Select and Transform

# Example of Selection: select all 'g' characters out a string##########################################
alphabet = 'abcdefghijklmnopqrstuvwxyz' # The collection
selected_chars = '' # What we want to extract
counter = 0 # Iterater and breaker

loop do
  current_char = alphabet[counter] # Local variable that retrieves the current value from iterated collection

  if current_char == 'g' # selection criteria
    selected_chars << current_char # appens current_char into the selected_chars string
  end

  counter += 1
  break if counter == alphabet.size # break when counter length is the same as the collection's length
end

selected_chars # => "g"

# Example of Transformation: append 's' after each element##########################################
fruits = ['apple', 'banana', 'pear']
transformed_fruits = []
counter = 0

loop do
  current_fruit = fruits[counter]

  transformed_fruits << current_fruit + 's' # Transformation Criteria; appends transformed string into array

  counter += 1
  break if counter == fruits.size
end

transformed_fruits # => ["apples", "bananas", "pears"]

# No need for an if statement since we're applying transformation to every element.
# Original array was unchanged
# When performing transformation, it's always important to pay attention to whether the original collection was mutated or if a new collection was returned.

########################### Extracting to Methods

# Most of the time selecting or transforming a collection is a specific action, thus can become a convenience method

# Example of a Selection Method: Get Them Vowels ##########################################
def select_vowel(string)
  selected_chars = ''
  counter = 0

  loop do
    current_char = string[counter]

    if "aeiouAeiou".include?(current_char)
      selected_chars << current_char
    end

    counter += 1
    break if counter == string.size
  end

  selected_chars
end
# Using this method and what it returns:
select_vowels('the quick brown fox')      # => "euioo"

sentence = 'I wandered lonely as a cloud'
select_vowels(sentence)                   # => "Iaeeoeaaou"

# Since it returns a string we can method chain:
number_of_vowels = select_vowels('hello world').size
number_of_vowels # => 3

### Practice Problem: Method that extracts a hash value ##########################################
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce)
  produce_keys = produce.keys
  selected_fruits = {}
  desired_value = 'Fruit'
  counter = 0

  loop do
    # Break is first because produce_list might be empty, thus breaking the loop
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce[current_key]

    if current_value == desired_value
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end

# Example of Transformation Method: Multiply by 2 (Array) ##########################################
def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

# Invoked like:
my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12] This is a new array, and doesn't mutate the caller

### Practice Problem: Multiply by 2 - Destructive ##########################################
def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] *= 2

    counter += 1
  end
  numbers
end

# Invoked:
my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers)   # => [2, 8, 6, 14, 4, 12]

my_numbers                    # => [2, 8, 6, 14, 4, 12]

# Example of Transformation Method: Multiply by 2 if value is odd (Array) ##########################################
def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if current_number.odd?
    doubled_numbers << current_number


    counter += 1
  end

  doubled_numbers
end

# Invoked:
my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

# not mutated
my_numbers                      # => [1, 4, 3, 7, 2, 6]

### Practice Problem: Multiply by 2 by odd indices in array ##########################################
# Unfortunately, I didn't read the direction clearly, and thought the prompt asked if I could create a method that doubled a number by its position.
def double_number_by_position(numbers, position)
  target_position = position - 1
  doubled_number = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_value = numbers[counter]
    desired_position = numbers[target_position]
    current_value *= 2 if current_value == desired_position
    doubled_number << current_value

    counter += 1
  end

  doubled_number
end

# Instead it clearly wanted by odd indices. LS Solution:
def double_odd_indices(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_indices(my_numbers) # => [1, 8, 3, 14, 2, 12]

# I'm keeping mine just because it took some time to think about how to make it.
    
########################### More Flexible Methods

# Create methods that can handle more arguments, thus altering the logic and iteration patterns

# Example General Selection Method: Grab either fruits or vegetables from hash ###################################################### 
def general_selection(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_values = {}

  loop do
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == selection_criteria
      selected_values[current_key] = current_value
    end

    counter += 1
  end

  selected_values
end

# Invoked:
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

general_select(produce, 'Fruit')     # => {"apple"=>"Fruit", "pear"=>"Fruit"}
general_select(produce, 'Vegetable') # => {"carrot"=>"Vegetable", "broccoli"=>"Vegetable"}
general_select(produce, 'Meat')      # => {}

### Practice Problem: Multiply by and number for each element in the array ##########################################

def multiply(numbers, multiplier)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    multiplied_numbers << current_number * multiplier

    counter += 1
    end

  multiplied_numbers 
end

# Example General Selection Method: Grab the letters from the string ###################################################### 
def select_letter(sentence, character)
  selected_characters = ''
  counter = 0

  loop do
    break if counter == sentence.size

    current_char = sentence[counter]
    selected_characters << current_char if current_char == character

    counter += 1
  end

  selected_characters
end

=begin
We often want to perform iteration, selection or transformation operations on a collection. Using these 3 actions, we can manipulate a collection nearly any way we need to.

Typically, these are generic actions that we can move into a method, so that we can perform these generic operations repeatedly on different collections.

Pay attention to when the original collection is mutated vs when the method returns a new collection. This might seem trivial right now, but it's a source of a lot of misunderstanding. Make certain to study this.

Understand how these methods can be made more generic by allowing for additional parameters to specify some criteria for selection or transformation.

Finally, it's common to chain actions on collections; but pay special mind to the return value, especially if the return value is an empty collection or nil. Trying to chain methods on empty collections or nil is dangerous and results in a lot of broken programs.
=end






















