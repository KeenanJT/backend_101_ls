VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def win?(player1, player2)
  player1 == 'rock' && player2 == 'scissors' ||
    player1 == 'scissors' && player2 == 'paper' ||
    player1 == 'paper' && player2 == 'rock'
end

def display_results(player, computer)
  if win?(player, computer)
    prompt "You won!"
  elsif win?(computer, player)
    prompt "Computer won!"
  else
    prompt "It's a tie!"
  end
end

loop do
  choice = ''
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "Not a valid choice."
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt "You chose: #{choice}; Computer chose: #{computer_choice}"

  display_results(choice, computer_choice)

  prompt 'Want to play again?'
  answer = gets.chomp
  break unless answer.downcase.start_with? "y"
end

prompt "Thanks for playing! Bye :)"
