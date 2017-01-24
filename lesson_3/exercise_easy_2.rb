# Question 1 - In this hash of people and their age, see if "Spot" is present.
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# ANSWER:
ages.has_key? "Spot" # Returns false as well, but at least we know this method is checking the keys only, thus increasing readability.
ages.key? "Spot" # Exactly the same as has_key?

# Bonus: What are two other hash methods that would work just as well for this solution?
# ANSWER:
ages.include? "Spot" # Works, but only checks the key. Unfortunately, the name of the method doesn't tell the user that.
ages.member? "Spot" # Same as include?

#################################################################################################### 

# Question 2 - Starting with this string:
munsters_description = "The Munsters are creepy in a good way."
# Convert the string in the following ways (code will be executed on original munsters_description above):
a) "The munsters are creepy in a good way."
b) "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
c) "the munsters are creepy in a good way."
d) "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

# ANSWER:
# a)
munsters_description.capitalize!
# b)
munsters_description.swapcase!
# c)
munsters_description.downcase!
# d)
munsters_description.upcase!

####################################################################################################

# Question 3 - We have most of the Munster family in our age hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# add ages for Marilyn and Spot to the existing hash
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

# ANSWER:
ages.merge!(additional_ages)

####################################################################################################

# Question 4 - See if the name "Dino" appears in the string below:
advice = "Few things in life are as important as house training your pet dinosaur."

# ANSWER: 
advice.include? "Dino" # Returns false. Dino is capitalized, while dinosaur's "dino" is lowercase.
advice.match("Dino") # Returns nil.
####################################################################################################

# Question 5 - Show an easier way to write this array:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

# ANSWER:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

####################################################################################################

# Question 6 - How can we add the family pet "Dino" to our usual array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# ANSWER:
flintstones << "Dino"

####################################################################################################

# Question 7 - In the previous exercise we added Dino to our array like this:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
# How can we add multiple items to our array? (Dino and Hoppy)

# ANSWER:
flintstones << "Dino" << "Hoppy"
flintstones.push("Dino").push("Hoppy")

####################################################################################################

# Question 8 - Shorten this sentence:
advice = "Few things in life are as important as house training your pet dinosaur."
# ...remove everything starting from "house".
# Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". 
# But leave the advice variable as "house training your pet dinosaur.".

# ANSWER:
advice.slice!(0..38)
advice.slice!(0, advice.index('house'))

# Bonus: As a bonus, what happens if you use the String#slice method instead?
# It doesn't mutate the caller, thus creating a new string with the slice. The original is not changed.
advice.slice(0..38) 
advice.slice(0, advice.index('house'))
advice[0..38]
advice[0...advice.index('house')]
####################################################################################################

# Question 9 - Write a one-liner to count the number of lower-case 't' characters in the following string:
statement = "The Flintstones Rock!"

# ANSWER:
statement.count "t"
statement.scan('t').count
####################################################################################################

# Question 10 - Back in the stone age (before CSS) we used spaces to align things on the screen. 
# If we had a 40 character wide table of Flintstone family members, 
# how could we easily center that title above the table with spaces?
title = "Flintstone Family Members"

# ANSWER:

