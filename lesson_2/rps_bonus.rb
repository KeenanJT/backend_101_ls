VALID_CHOICES = %w(r p x s l)
WINNING_MATCH = [%w(r x), %w(r l),
                 %w(p r), %w(p s),
                 %w(x p), %w(x l),
                 %w(s r), %w(s x),
                 %w(l p), %w(l s)]

def prompt(message)
  puts "=> #{message}"
end

def win?(winner, loser)
  winning_choices = [winner, loser]

  WINNING_MATCH.include?(winning_choices)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt "You ~*~[ Win! ]~*~"
  elsif win?(computer, player)
    prompt "Computer |_[ Wins! ]_|"
  else
    prompt "It's a tie!"
  end
end

def choice_to_message(choice)
  case choice
  when 'x' then 'Scissor'
  when 'p' then 'Paper'
  when 'r' then 'Rock'
  when 'l' then 'Lizard'
  when 's' then 'Spock'
  end
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

  prompt "You cast [[ #{choice_to_message(player_choice)} ]]"
  prompt "Computer cast [[ #{choice_to_message(computer_choice)} ]]"

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
    prompt "Want to play again? ('y' to continue)"
    answer = gets.chomp.downcase
    break unless answer.downcase.start_with? 'y'
  end
end

prompt "Thanks for playing! Bye :)"
