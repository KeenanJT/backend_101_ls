# Psuedo Code
# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# Method - gets - waits for the user to input a value then the program ends
# Method - puts - prints the output

puts "Welcome to the Calculator!"

puts "What's the first number?: "
num1 = gets.chomp

puts "What is the second number?: "
num2 = gets.chomp

puts "Which operation do you want to perform?: 1) add 2) subtract 3) multiply 4) divide: "
operation = gets.chomp

if operation == '1'
  result = num1.to_i + num2.to_i
elsif operation == '2'
  result = num1.to_i - num2.to_i
elsif operation == '3'
  result = num1.to_i * num2.to_i
else operation == '4'
  result = num1.to_f / num2.to_f
end

puts "The result is #{result}"

    