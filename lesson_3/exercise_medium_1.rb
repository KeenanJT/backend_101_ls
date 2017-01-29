# Question 1 - Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).
# For this exercise, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!

# ANSWER:
10.times {|i| puts "The Flintstones Rock!".rjust(i += 21)}
# LS Solution:
10.times {|number| puts (" " * number) + "The Flintstones Rock!"}
#################################################################################################### 

# Question 2 - The result of the following statement will be an error:
puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?

# ANSWER: Error = TypeError: no implicit conversion of Fixnum into String
# a) String Interpolation
puts "the value of 40 + 2 is #{40 + 2}"
# b) Converting Int to String
puts "the value of 40 + 2 is " + (40 + 2).to_s
####################################################################################################

# Question 3 - Alan wrote the following method, which was intended to show all of the factors of the input number:
def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end
# Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. 
# How can you change the loop construct (instead of using begin/end/until) to make this work? 
# Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

# ANSWER:
def factors(number)
  dividend = number
  divisors = []
  loop do
    if number <= 0
      puts "Sorry, non-zero and negative inputs will not work. Please try again."
    else
      divisors << number / dividend if number % dividend == 0
      dividend -= 1
    end
    break if dividend == 0
  end
  divisors
end
# Bonus 1 - What is the purpose of the number % dividend == 0 ?
# ANSWER: To check if the result of the division is an integer number with no remainder.

# Bonus 2 - What is the purpose of the second-to-last line in the method (the divisors before the method's end)?
# ANSWER: Methods need to return something, so we're returning an array filled with the divisors.

####################################################################################################

# Question 4 - Alyssa was asked to write an implementation of a rolling buffer. 
# Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.
# She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". 
# Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

# ANSWER: 
# rolling_buffer1 mutates the caller buffer, while rolling buffer2 doesn't.

####################################################################################################

# Question 5 - Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. 
# A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.
# Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. 
# What's wrong with the code?
limit = 15

def fib(first_num, second_num)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# ANSWER: He needs to pass in the limit as an argument. The limit variable is in the outter scope, and can't get into the method unless passed through.
def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

####################################################################################################

# Question 6 - In an earlier exercise we saw that depending on variables to be modified by called methods can be tricky:
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
# We learned that whether the above "coincidentally" does what we think we wanted "depends" upon what is going on inside the method.
# How can we refactor this exercise to make the result easier to predict and easier for the next programmer to maintain?

# ANSWER: 
def less_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

####################################################################################################

# Question 7 - What is the output of the following code?
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# ANSWER: 34 - reassigning an integer is non-desctructive on the caller.

####################################################################################################

# Question 8 - One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:

mess_with_demographics(munsters)

# Did the family's data get ransacked? Why or why not?

# ANSWER: Yes, beacuse in ruby object's ids get passed in, not the value, so his method should of reassigned the hash to a local variable then did work on that variable, instead he changed the calling hash.

####################################################################################################

# Question 9 - Method calls can take expressions as arguments. 
# Suppose we define a function called rps as follows, which follows the classic rules of rock-paper-scissors game, but with a slight twist that it declares whatever hand was used in the tie as the result of that tie.
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
# What is the result of the following call?
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# ANSWER: paper
rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
rps(rps(rps("rock", "paper"), "rock"), "rock")
rps(rps("paper", "rock"), "rock")
rps("paper", "rock")
"paper"
####################################################################################################

# Question 10 - Consider these two simple methods:
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
# What would be the output of this code:
bar(foo)

# ANSWER: "no"