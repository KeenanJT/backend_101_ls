def prompt(message)
  puts ">>> " + message
end

def integer?(num)
  Integer(num || '')
rescue ArgumentError
  nil
end

def float?(num)
  num.to_f.to_s == num
end

def valid_number?(num)
  integer?(num) || float?(num)
end

# ~*~*~*~*~* INFORMATION *~*~*~*~*~*~
# Welcome / Name
prompt "Welcome to a monlthy mortgage payment calculator!\n What is your name?"
name = ''
loop do
  name = gets.chomp.capitalize
  if name.empty?
    prompt "Please try again with a valid name."
  else
    break
  end
end

loop do
  # Loan Amount
  prompt "#{name}, what is your loan amount? (ex: $14,230 or ex: $143)"
  loan_amount = ''
  loop do
    loan_amount = gets.chomp
    # FIXME: delete isn't taking the dollar sign or comma out.
    loan_amount.delete! "$ ,"
    if valid_number?(loan_amount)
      break
    else
      prompt "#{loan_amount} is not a valid number, please try again."
    end
  end

  # Annual Percentage Rate (APR)
  prompt "Thanks #{name}! Now what is your APR %? (ex: 6.8% or 5.5%):"
  yearly_interest = ''
  loop do
    yearly_interest = gets.chomp
    yearly_interest.delete! "%"
    if valid_number?(yearly_interest)
      break
    else
      prompt "#{yearly_interest} is not valid, please try again."
    end
  end

  # Loan Duration (years / float)
  prompt "Okay #{name}, now what is the duration of your loan? (ex: 2.5 years)"
  yearly_loan_duration = ''
  loop do
    yearly_loan_duration = gets.chomp
    yearly_loan_duration.delete! "years year"
    if valid_number?(yearly_loan_duration)
      break
    else
      prompt "#{yearly_loan_duration} is not valid, please try again."
    end
  end
  # ~*~*~*~*~*~* CALCULATIONS *~*~*~*~*~*~*~

  # Monthly Interest Rate (float)
  monthly_interest = (yearly_interest.to_f / 12.0) / 100.0

  # Loan Duration (months / float)
  monthly_loan_duration = yearly_loan_duration.to_f * 12.0

  # Monthly Payment (float)
  # formula: m = p * (j / (1 - (1 + j)**(-n)))
  # m = monthly payment | p = loan amount | j = monthly interest rate | n = loan duration in months
  monthly_payments = loan_amount.to_f * (monthly_interest.to_f / (1 - (1 + monthly_interest.to_f)**(-monthly_loan_duration.to_f)))
  prompt "Thank you for the information. We'll work our magic!\n calculating..."
  sleep(2.5)
  prompt "Your montly payment is $#{monthly_payments.round(2)}!"

  prompt "#{name}, would you like to calculate again? ('y' to continue)"
  answer = gets.chomp.downcase
  # TODO - Check why y isn't refreshing the loop
  break unless answer.downcase.start_with? "y"
end
