# frozen_string_literal: true

# Handles displaying text
module Display
  def self.lore
    puts <<-HEREDOC
      Welcome to the world of Hang 'em
      The year is 2509 and you are about to witness the Tribunal.
      That is, unless you can save the would-be executed.
      You are an Invoker and with your power, you can teleport the judged away.
      However, in order for your teleportation magic to have any effect...
      You will have to know the exact single word on their mind.
    HEREDOC
  end

  def self.save_select(hash)
    puts 'Enter the number of the save you would like to select'
    hash.each { |k, v| puts "#{k} - #{v}"}
  end

  def self.mode_prompt
    puts 'Would you like to start a new game or load a previous game?'
    puts '1 - Start a new game'
    puts '2 - Load a game'
    puts '3 - Lore'
  end

  def self.guesses(guess_array)
    puts "Letters guessed: #{guess_array.join(', ')}"
  end

  def self.state(state_array, incorrect_guesses)
    puts "Number of incorrect guesses: #{incorrect_guesses}"
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

  def self.save_success(file_name)
    puts "Game successfully saved as: #{file_name}"
    puts 'Thank you for playing.'
  end

  def self.welcome
    puts 'Welcome back.'
  end

  def self.invalid_input
    puts 'Invalid Input. Try again.'
  end

  def self.win(name)
    puts "You've won."
    sleep 1
    puts "You saved #{name} from death."
  end

  def self.lose(name, word)
    puts GAME_STATES[6]
    puts "You've lost"
    sleep 1
    puts "#{name} has been hung."
    sleep 1
    puts "#{name}'s final thought was '#{word.join('')}'"
  end

  GAME_STATES = ["   ╒═══╗\n   ┊   ║\n       ║\n       ║\n       ║\n       ║\n┌──────╨┐",
                 "   ╒═══╗\n   ┊   ║\n   ☹   ║\n       ║\n       ║\n       ║\n┌──────╨┐",
                 "   ╒═══╗\n   ┊   ║\n  \\☹   ║\n       ║\n       ║\n       ║\n┌──────╨┐",
                 "   ╒═══╗\n   ┊   ║\n  \\☹/  ║\n       ║\n       ║\n       ║\n┌──────╨┐",
                 "   ╒═══╗\n   ┊   ║\n  \\☹/  ║\n   |   ║\n       ║\n       ║\n┌──────╨┐",
                 "   ╒═══╗\n   ┊   ║\n  \\☹/  ║\n   |   ║\n  /    ║\n       ║\n┌──────╨┐",
                 "   ╒═══╗\n   ┊   ║\n  \\☹/  ║\n   |   ║\n  / \\  ║\n       ║\n┌──────╨┐"].freeze
end
