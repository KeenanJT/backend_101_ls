# Question 1 - How would you order this array of number strings by descending numeric value?
arr = ['10', '11', '9', '7', '8']

# ANSWER:
arr.sort {|a,b| b.to_i <=> a.to_i }

#################################################################################################### 

# Question 2 -How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

# My ANSWER:
books.sort do |a,b|
  a[:published].to_i <=> b[:published].to_i
end

# LS ANSWER:
books.sort_by { |book| book[:published] }
#  Since all the values in question are four characters in length, in this case we can simply compare the strings without having to convert them to integers.

####################################################################################################

# Question 3 - For each of these collection objects demonstrate how you would reference the letter 'g'.
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# ANSWER:
arr1[2][1][3] # => "g"
arr2[1][:third][0] # => "g"
arr3[2][:third][0][0] # => "g"
hsh1['b'][1] # => "g"
hsh2[:third].keys[0] # => "g"

####################################################################################################

# Question 4 - For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.
arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

# ANSWER:
arr1[1][1] = 4 # => [1, [2, 4], 4] 
arr2[2] = 4 # => [{:a=>1}, {:b=>2, :c=>[7, 6, 5], :d=>4}, 4]
hsh1[:first][2][0] = 4 # => {:first=>[1, 2, [4]]}
hsh2[['a']][:a][2] = 4 # => {["a"]=>{:a=>["1", :two, 4], :b=>4}, "b"=>5}

####################################################################################################

# Question 5 - Given this nested Hash:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# figure out the total age of just the male members of the family.
# My ANSWER:
total_male_age = 0
munsters.each do |name, info|
  if info['gender'] == "male"
    total_male_age += info['age']
  end
end
# => 444

# LS ANSWER:
total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

total_male_age # => 444

####################################################################################################

# Question 6 - Given this previously seen family hash, print out the name, age and gender of each family member:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# ANSWER:
munsters.each do |name, info|
  puts "#{name} is a #{info["age"]}-year-old #{info["gender"]}."
end

####################################################################################################

# Question 7 - Given this code, what would be the final values of a and b? Try to work this out without running the code.
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a
# ANSWER:
a # => 2
b # => [3, 8]

####################################################################################################

# Question 8 - Using the each method, write some code to output all of the vowels from the strings.
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
# ANSWER:
hsh.each do |_, value|
  value.each do |string|
    string.scan(/[aeiou]/) do |vowel|
      puts vowel
    end
  end
end

####################################################################################################

# Question 9 - Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# ANSWER:
arr.map do |sub_array|
  sub_array.sort do |a, b|
    b <=> a
  end
end

####################################################################################################

# Question 10 - Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
# ANSWER:
arr.map do |hash|
  new_hash = {}
  hash.each do |key, value|
    new_hash[key] = value + 1
  end
  new_hash
end

####################################################################################################

# Question 11 - Given the following data structure use a combination of methods, including either the select or reject method, 
# to return a new array identical in structure to the original but containing only the integers that are multiples of 3.
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
# ANSWER:
arr.map do |sub_array|
  sub_array.select do |num|
    num % 3 == 0
  end
end
# => [[], [3], [9], [15]] 

####################################################################################################

# Question 12 - Given the following data structure, and without using the Array#to_h method, 
# write some code that will return a hash where the key is the first item in each sub array and the value is the second item.
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# MY ANSWER: Keeps the array as the outer layer
arr.map do |sub_array|
  Hash[*sub_array]
end
# => [{:a=>1}, {"b"=>"two"}, {"sea"=>{:c=>3}}, {{:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}] 

# LS ANSWER: Drops the outer layer, and creates the hashes
hsh = {}
arr.each do |item|
  hsh[item[0]] = item[1]
end
# => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

####################################################################################################

# Question 13 - Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically according to the numeric value of the odd integers they contain.
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
# The sorted array should look like this:
[[1, 8, 3], [1, 6, 7], [1, 4, 9]]
# ANSWER:
arr.sort_by do |sub_array|
  sub_array.select do |num|
    num.odd?
  end
end
# => [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

####################################################################################################

# Question 14 - Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. 
# The sizes should be uppercase and the colors should be capitalized.
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
# The return value should look like this:
[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# LS ANSWER:
hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end
# => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# MY ANSWER to grab all the fruits and veggy sizes and color:
hsh.map do |fruit, details|
  new_arr = []
  new_arr << details[:colors].map do |color|
    color.capitalize
  end

  new_arr << details[:size].upcase

  new_arr
end
# => [[["Red", "Green"], "SMALL"], [["Orange"], "MEDIUM"], [["Red", "Green"], "MEDIUM"], [["Orange"], "MEDIUM"], [["Green"], "LARGE"]] 

####################################################################################################

# Question 15 - Given this data structure write some code to return an array which contains only the hashes where all the integers are even.
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# ANSWER:
arr.map do |hash|
  hash.select do |key, value|
    value.all? do |num|
      num.even?
    end
  end
end
# => [{}, {:b=>[2, 4, 6], :d=>[4]}, {:e=>[8], :f=>[6, 10]}] 
####################################################################################################

# Question 16 - Write a method that returns one UUID when called with no parameters.
# Example: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# LS ANSWER:
def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

