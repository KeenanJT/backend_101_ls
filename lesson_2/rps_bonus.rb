VALID_CHOICES = %w(r p x s l)

def prompt(message)
  puts "=> #{message}"
end

def win?(player1, player2)
  player1 == 'x' && player2 == 'p' ||
    player1 == 'p' && player2 == 'r' ||
    player1 == 'r' && player2 == 'l' ||
    player1 == 'l' && player2 == 's' ||
    player1 == 's' && player2 == 'x' ||
    player1 == 'x' && player2 == 'l' ||
    player1 == 'l' && player2 == 'p' ||
    player1 == 'p' && player2 == 's' ||
    player1 == 's' && player2 == 'r' ||
    player1 == 'r' && player2 == 'x'
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

def choice_to_message(choice)
  message = case choice
            when 'x'
              'Scissor'
            when 'p'
              'Paper'
            when 'r'
              'Rock'
            when 'l'
              'Lizard'
            when 's'
              'Spock'
            end
  message
end

player_score = 0
computer_score = 0

loop do
  player_choice = ''

  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}
        (r) = Rock
        (p) = Paper
        (x) = Scissor
        (s) = Spock
        (l) = Lizard
    Best out of 5 wins!"

    player_choice = gets.chomp

    if VALID_CHOICES.include?(player_choice)
      break
    else
      prompt "Not a valid player_choice."
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt "You chose: #{choice_to_message(player_choice)}; Computer chose: #{choice_to_message(computer_choice)}"

  display_results(player_choice, computer_choice)

  if win?(player_choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, player_choice)
    computer_score += 1
  else
    next
  end

  prompt "Your score: #{player_score}; Computer score: #{computer_score}"

  if player_score == 5 || computer_score == 5
    prompt "Want to play again? (y/n)"
    answer = gets.chomp.downcase
    if answer == 'y'
      next
    elsif answer == 'n'
      break
    end
  end
end

prompt "Thanks for playing! Bye :)"
