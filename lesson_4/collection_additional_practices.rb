# Question 1 - Given the array below
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the values are the positions in the array.

# Solution 1:
flintstones_dictionary = {}
counter = 0

flintstones.each do |name|
  flintstones_dictionary[name] = counter
  counter += 1
end

flintstones_dictionary # => {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5} 

# Solution 2:
flintstones_dictionary = {}

flintstones.each_with_index do |name, index|
  flintstones_dictionary[name] = index
end

flintstones_dictionary # => {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}

# Solution 3:
flintstones_dictionary = {}
counter = 0

loop do
  break if counter == flintstones.size

  current_name = flintstones[counter]
  flintstones_dictionary[current_name] = counter

  counter += 1
end

flintstones_dictionary # => {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}

#################################################################################################### 

# Question 2 - Add up all of the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# Solution 1: 
munster_ages = ages.values.sum # => 6174

# Solution 2: 
munster_ages = ages.values
sum_of_ages = 0

munster_ages.each {|age| sum_of_ages += age }
sum_of_ages # => 6174

# Solution 3:
ages.each_value { |value| sum_of_ages += value }
sum_of_ages # => 6174


####################################################################################################

# Question 3 - In the age hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# throw out the really old people (age 100 or older).

# Solution 1:
ages.select! { |name, age| age < 100 }
ages # => {"Herman"=>32, "Lily"=>30, "Eddie"=>10}

# Solution 2:
ages.delete_if { |name, age| age > 100 }
ages # => {"Herman"=>32, "Lily"=>30, "Eddie"=>10} 

# Solution 3:
ages.reject! { |name, age| age > 100 }
ages # => {"Herman"=>32, "Lily"=>30, "Eddie"=>10} 

####################################################################################################

# Question 4 - Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# Solution 1:
ages.sort_by { |name, age| age }.first # => { "Eddie" => 10 }

# Solution 2:
ages.values.min # => 10

# Solution 3:
ages.min_by {|name, age| age } # => { "Eddie" => 10 }

####################################################################################################

# Question 5 - In the array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"

# Solution 1:
flintstones.select! {|name| name.start_with? "Be" }
flintstones # => ["Betty"]

# Solution 2:
flintstones.grep(/Be/) # => ["Betty"]

# Solution 3:
flintstones.index { |name| name[0, 2] == "Be" }# => ["Betty"]


####################################################################################################

# Question 6 - Amend this array so that the names are all shortened to just the first three characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Solution 1:
flintstones.map! { |name| name[0, 3] }

# Solution 2:
flintstones.map { |name| name.slice(0, 3)}

# Solution 3: Using a range
flintstones.map { |name| name.slice(0..2)}

####################################################################################################

# Question 7 - Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"
# ex:
{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

# Solution 1:
statement.chars.group_by(&:chr).map { |k, v| [k, v.size] }.to_h

# LS Solution:
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

####################################################################################################

# Question 8 - What happens when we modify an array while we are iterating over it? What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number # Prints 1
  numbers.shift(1) # Removes the first value, changing the array the loop is working with
end
# ANSWER: 
# Output is 1 3

# What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# ANSWER:
# Output is 1 2

####################################################################################################

# Question 9 - As we have seen previously we can use some built-in string methods to change the case of a string. 
# A notably missing method is something provided in Rails, but not in Ruby itself...titleize.
# This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:
words = "the flintstones rock"
# becomes
words = "The Flintstones Rock"
# Write your own version of the rails titleize implementation.

# Solution 1:
words[0] = "T"
words[4] = "F"
words[16] = "R"
words # => "The Flintstones Rock"

# Solution 2:
words.split(/ |\_|\-/).map(&:capitalize).join(" ")

# Solution 3:
words.split.map { |word| word.capitalize }.join(" ")

####################################################################################################

# Question 10 - Given the munsters hash below
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior).
# Your solution should produce the hash below:
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

# ANSWER:
# loop into the hash
# check the age key's value.
# if its value is less than 17 then add the key/vale age_group > kid, age range 18-64 then age_group = adult, else age_group = senior

munsters.each do |key, value|  
  case value["age"]
    when 0..17
      value["age_group"] = "kid"
    when 18..64
      value["age_group"] = "adult"
    else
      value["age_group"] = "senior"
  end
end

