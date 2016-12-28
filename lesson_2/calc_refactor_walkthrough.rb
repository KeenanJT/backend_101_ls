def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    'ADDING'
  when '2'
    'SUBTRACTING'
  when '3'
    'MULTIPLYING'
  when '4'
    'DIVIDING'
  end
end

prompt "Welcome to the Calculator! What is your name?"
name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt "Make sure you use a valid name."
  else
    break
  end
end

prompt "#{name} are you ready to rock and calculate?"

loop do
  # ASKING FOR THE FIRST NUMBER
  num1 = ''
  loop do
    prompt "What's the first number you'd like to calculate?"
    num1 = gets.chomp
    if valid_number?(num1)
      break
    else
      prompt "#{num1} isn't a valid number, please try again..."
    end
  end
  # ASKING FOR THE SECOND NUMBER
  num2 = ''
  loop do
    prompt "What is the second number? "
    num2 = gets.chomp
    if valid_number?(num2)
      break
    else
      prompt "#{num2} isn't a valid number, please try again..."
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

prompt "Thanks #{name} for calculating with us :)"
