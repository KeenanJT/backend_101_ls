def prompt(message)
  puts ">>> " + message
end

def integer(num)
  num.to_i.to_s == num
end

def float(num)
  num.to_f.to_s == num
end

def valid_number?(num)
  (integer(num) && num.to_i > 0) || (float(num) && num.to_f > 0)
end

def valid_name?(name)
  /[a-zA-Z]/ === name
end

def zero_apr_interest(loan_amount, monthly_duration)
  loan_amount.to_f / monthly_duration.to_f
end

def apr_interest(loan_amount, monthly_interest, monthly_duration)
  loan_amount.to_f * (monthly_interest.to_f /
    (1 - (1 + monthly_interest.to_f)**-monthly_duration.to_f))
end

def calculate_payments(loan_amount, monthly_interest, monthly_duration)
  if monthly_interest.to_f.zero?
    zero_apr_interest(loan_amount, monthly_duration)
  else
    has_apr_interest(loan_amount, monthly_interest, monthly_duration)
  end
end

prompt "Welcome to a monthly mortgage payment calculator!\n What is your name?"
name = ''
loop do
  name = gets.strip.capitalize
  if valid_name?(name)
    break
  else
    prompt "Please try again with a valid name."
  end
end

loop do
  prompt "#{name}, what is your loan amount? (ex: $14,230 or ex: $143)"
  loan_amount = ''
  loop do
    loan_amount = gets.chomp.strip
    loan_amount.delete! "$ ,"
    if valid_number?(loan_amount)
      break
    else
      prompt "#{loan_amount} is not a valid number, please try again."
    end
  end

  prompt "Thanks #{name}! Now what is your APR %? (ex: 6.8% or 5.5%):"
  yearly_interest = ''
  loop do
    yearly_interest = gets.chomp.strip
    yearly_interest.delete! "%"
    if valid_number?(yearly_interest) || yearly_interest.to_f == 0.0
      break
    else
      prompt "#{yearly_interest} is not valid, please try again."
    end
  end

  monthly_interest = (yearly_interest.to_f / 12.0) / 100.0

  prompt "Okay #{name}, now what is the duration of your loan? (ex: 2.5 years)"
  yearly_duration = ''
  loop do
    yearly_duration = gets.chomp.strip
    yearly_duration.delete! "years year"
    if valid_number?(yearly_duration)
      break
    else
      prompt "#{yearly_duration} is not valid, please try again."
    end
  end

  monthly_duration = yearly_duration.to_f * 12.0

  monthly_payments = calculate_payments(loan_amount,
                                        monthly_interest,
                                        monthly_duration)

  prompt "Thank you for the information. We'll work our magic!\n calculating..."
  sleep(2)
  prompt "Your monthly payment is $#{monthly_payments.round(2)}!"

  prompt "#{name}, would you like to calculate again? ('y' to continue)"
  answer = gets.chomp.downcase
  break unless answer.downcase.start_with? "y"
end

prompt "Thanks #{name} for calculating with us :)"
