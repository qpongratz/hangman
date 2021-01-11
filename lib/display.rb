# frozen_string_literal: true

# Handles displaying text
module Display
  def self.guesses(guess_array)
    puts "Letters guessed: #{guess_array.join(', ')}"
  end

  def self.state(state_array, incorrect_guesses)
    puts "Number wrong times: #{incorrect_guesses}"
    puts GAME_STATES[incorrect_guesses]
    puts state_array.join(' ')
  end

  def self.correct
    puts 'Your letter was in the word.'
  end

  def self.incorrect
    puts 'Your letter was not in the word.'
  end

  def self.guess_prompt
    puts 'Guess a letter by typing the letter of your choice'
    puts 'Or type "1" to save your game.'
  end

  def self.invalid_input
    puts 'aint no letter'
  end

  def self.win
    puts 'you won'
  end

  def self.lose(word)
    puts GAME_STATES[6]
    puts "You've lost"
    puts "The word was '#{word.join('')'}"
  end

  GAME_STATES = ["   ╒═══╗\n   ┊   ║\n       ║\n       ║\n       ║\n       ║\n┌──────╨┐",
                 "   ╒═══╗\n   ┊   ║\n   ☹   ║\n       ║\n       ║\n       ║\n┌──────╨┐",
                 "   ╒═══╗\n   ┊   ║\n  \\☹   ║\n       ║\n       ║\n       ║\n┌──────╨┐",
                 "   ╒═══╗\n   ┊   ║\n  \\☹/  ║\n       ║\n       ║\n       ║\n┌──────╨┐",
                 "   ╒═══╗\n   ┊   ║\n  \\☹/  ║\n   |   ║\n       ║\n       ║\n┌──────╨┐",
                 "   ╒═══╗\n   ┊   ║\n  \\☹/  ║\n   |   ║\n  /    ║\n       ║\n┌──────╨┐",
                 "   ╒═══╗\n   ┊   ║\n  \\☹/  ║\n   |   ║\n  / \\  ║\n       ║\n┌──────╨┐"].freeze

end
