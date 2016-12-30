require 'pry'

def prompt(message)
  puts "=> #{message}"
end
# 1 - Cleaning up valid_number?. The Integer class handles conversions easily, but if the string can't convert then there's an ArgumentError, in which we will throw a nil.
    # This allows the program to continue running, and the loops to prompt for a valid number.
def integer?(num)
  Integer(num || '')
  rescue ArgumentError
    nil
end

# 2 - number? method. Verifying that only valid numbers(ints and floats) are entered.
# Create a float checker
def float?(num)
  num.to_f.to_s == num
end

# Now create a method that checks if the input is an Int or Float
def valid_number?(num)
  integer?(num) || float?(num)
end

# 3 - Changing operation message
def operation_to_message(string)
  answer = case string
            when '1'
              'ADDING'
            when '2'
              'SUBTRACTING'
            when '3'
              'MULTIPLYING'
            when '4'
              'DIVIDING'
            end
  answer
end

# 4 - Messaging dictionary instead of YAML
message = {
  name_messages: {
    welcome: 'Welcome to the Calculator! What is your name?', 
    ready: '%{name} are you ready to rock and calculate?',
    invalid: 'Make sure you use a valid name.',
    thanks: 'Thanks %{name} for calculating with us :)',
    },
  number_messages: {
    asking: ["What's the first number you'd like to calculate?","What is the second number? "],
    invalid: "Your number isn't a valid number, please try again...",
  }
}

prompt message[:name_messages][:welcome]
name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt message[:name_messages][:invalid]
  else
    break
  end
end

prompt message[:name_messages][:ready] % {name: name}

loop do
  # ASKING FOR THE FIRST NUMBER
  num1 = ''
  loop do
    prompt message[:number_messages][:asking][0]
    num1 = gets.chomp
    if valid_number?(num1)
      break
    else
      prompt message[:number_messages][:invalid]
    end
  end
  # ASKING FOR THE SECOND NUMBER
  num2 = ''
  loop do
    prompt message[:number_messages][:asking][1]
    num2 = gets.chomp
    if valid_number?(num2)
      break
    else
      prompt message[:number_messages][:invalid]
    end
  end
  # ASKING FOR OPERATOR
  operator_prompt = <<-MSG
  Which operation do you want to perform?
    1) ADD
    2) SUBTRACT
    3) MULTIPLY
    4) DIVIDE
  MSG
  prompt operator_prompt

  operation = ''
  loop do
    operation = gets.chomp
    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt "Must choose 1, 2, 3 or 4"
    end
  end

  prompt "#{operation_to_message(operation)} two numbers for optimal results..."
  sleep(2.5)
  result = case operation
           when '1'
             num1.to_i + num2.to_i
           when '2'
             num1.to_i - num2.to_i
           when '3'
             num1.to_i * num2.to_i
           when '4'
             num1.to_f / num2.to_f
           end
  # SHOWING RESULTS
  prompt "The result is #{result}"
  # ASKING TO RESTATE THE LOOP
  prompt "Do you want to perform another calculation?(press 'Y' to calculate)"
  answer = gets.chomp
  break unless answer.downcase.start_with? "y"
end

prompt message[:name_messages][:thanks] % {name: name}
