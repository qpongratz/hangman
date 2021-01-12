# frozen_string_literal: true

# Handles displaying text
module Display
  def self.intro
    puts 'small introduction'
  end
  
  def self.save_select(hash)
    puts 'Enter the number of the save you would like to select'
    hash.each { |k, v| puts "#{k} - #{v}"}
  end

  def self.mode_prompt
    puts 'Would you like to start a new game or load a previous game?'
    puts '1 - Start a new game'
    puts '2 - Load a game'
  end

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

  def self.name_prompt
    puts 'What would you like to be called?'
  end

  def self.welcome(name)
    puts "Welcome back, #{name}"
  end

  def self.invalid_input
    puts 'Invalid Input. Try again.'
    sleep 1
  end

  def self.win
    puts 'you won'
  end

  def self.lose(word)
    puts GAME_STATES[6]
    puts "You've lost"
    puts "The word was '#{word.join('')}'"
  end

  GAME_STATES = ["   ╒═══╗\n   ┊   ║\n       ║\n       ║\n       ║\n       ║\n┌──────╨┐",
                 "   ╒═══╗\n   ┊   ║\n   ☹   ║\n       ║\n       ║\n       ║\n┌──────╨┐",
                 "   ╒═══╗\n   ┊   ║\n  \\☹   ║\n       ║\n       ║\n       ║\n┌──────╨┐",
                 "   ╒═══╗\n   ┊   ║\n  \\☹/  ║\n       ║\n       ║\n       ║\n┌──────╨┐",
                 "   ╒═══╗\n   ┊   ║\n  \\☹/  ║\n   |   ║\n       ║\n       ║\n┌──────╨┐",
                 "   ╒═══╗\n   ┊   ║\n  \\☹/  ║\n   |   ║\n  /    ║\n       ║\n┌──────╨┐",
                 "   ╒═══╗\n   ┊   ║\n  \\☹/  ║\n   |   ║\n  / \\  ║\n       ║\n┌──────╨┐"].freeze
end
