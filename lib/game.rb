# frozen_string_literal: true

require_relative 'answer_checker'
require_relative 'player_input'
require_relative 'display'
require_relative 'save_handler'
require_relative 'file_reader'
require 'yaml'
require 'date'

# Handles general game flow.
class Game
  include Display
  include SaveSystem
  include FileReader
  attr_reader :file_name

  def start_game
    @player = PlayerInput.new
    @checker = AnswerChecker.new
    @incorrect_guesses = 0
    @checker.display_state(@incorrect_guesses)
    @game_over = false
    @name = make_name
    puts "#{@name} steps up to the gallows."
    sleep 1
    play_turn
  end

  def play_turn
    guess = @player.guess
    return save_game if guess == '1'

    @checker.correct_guess?(guess) ? correct_guess(guess) : incorrect_guess
    return if @game_over == true

    @checker.display_state(@incorrect_guesses)
    @player.display_guesses
    play_turn
  end

  def resume_game
    Display.welcome
    puts "#{@name} is at the gallows."
    @checker.display_state(@incorrect_guesses)
    @player.display_guesses
    play_turn
  end

  def incorrect_guess
    @incorrect_guesses += 1
    Display.incorrect
    end_game('lose') if @incorrect_guesses > 5
  end

  def correct_guess(guess)
    @answer_state = @checker.update_answer_state(guess)
    Display.correct
    end_game('win') if @checker.solved?
  end

  def end_game(status)
    @game_over = true
    status == 'win' ? Display.win(@name, @checker.secret_word) : Display.lose(@name, @checker.secret_word)
  end
end
