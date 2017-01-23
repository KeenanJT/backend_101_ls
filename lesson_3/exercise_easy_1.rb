# Question 1 - What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# ANSWER: => [1, 2, 3]. The uniq method takes out the multiples of an element, so it's only represented by one element. The two 2s became one 2.

#################################################################################################### 

# Question 2 - Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:
  # ANSWER: '?' indicates that a method returns a bool, while '!' indicates that a method mutates the caller, basically it's destructive and will change the original object.

  # a) what is != and where should you use it?
    # ANSWER: '!=' Checks if the value of two operands are equal or not, if values are not equal then condition becomes true.
  # b) put ! before something, like !user_name
    # ANSWER: Called Logical NOT Operator. Use to reverses the logical state of its operand. If a condition is true, then Logical NOT operator will make false.
  # c) put ! after something, like words.uniq!
    # ANSWER: If words was an array of greetings that have double the greetings in them. Adding the '!' after the uniq mutates words, so that it now only has one version of the greetings, and it will not change back.
  # d) put ? before something
    # ANSWER: If I put the '?' right before something it gives an error. But if I create a space between the '?' and a object, the error is specific, and says it cannot find a doc or definition.
  # e) put ? after something
    # ANSWER: It's the beginning of a ternary operation, thus keeps the program waiting for the rest.
  # f) put !! before something, like !!user_name
    # ANSWER: Turns user_name into a bool, returning true.

####################################################################################################

# Question 3 - Replace the word "important" with "urgent" in this string:
advice = "Few things in life are as important as house training your pet dinosaur."

# ANSWER:
advice.sub!('important', 'urgent')

####################################################################################################

# Question 4 - The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:
numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original array between method calls)?
numbers.delete_at(1)
# ANSWER: This method deletes at an index, so it would delete at index 1, which is the value 2.
numbers.delete(1)
# ANSWER: This method delete all items from self that are equal to the object, this it deletes the value 1, not the index.

####################################################################################################

# Question 5 - Programmatically determine if 42 lies between 10 and 100. (hint: Use Ruby's range object in your solution.)
#ANSWER:
(10..100).cover?(42)

(10..100).include?(42)

####################################################################################################

# Question 6 - Starting with the string "seven years ago...", show two different ways to put the expected "Four score and " in front of it.
famous_words_start = "Four score and "
famous_words_finish = "seven years ago..."

  # Option a)
  famous_words_start + famous_words_finish
  famous_words_start << famous_words_finish
  # Option b)
  famous_words_finish.prepend(famous_words_start)

####################################################################################################

# Question 7 - Fun with gsub
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

  # This gives us a string that looks like a "recursive" method call:
"add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"

  # If we take advantage of Ruby's Kernel#eval method to have it execute this string as if it were a "recursive" method call
eval(how_deep)

  # What will be the result?

# ANSWER:
42 # But I'm unsure why, as it did not work for me.

####################################################################################################

# Question 8 - If we build an array like this:
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

  # We will end up with this "nested" array:
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

# Make this into an un-nested array.
# ANSWER:
flintstones.flatten!


####################################################################################################

# Question 9 - Given the hash below
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
  # Turn this into an array containing only two elements: Barney's name and Barney's number
flintstones = flintstones.assoc("Barney")