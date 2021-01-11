# frozen_string_literal: true

require_relative 'answer_checker'
require_relative 'player_input'
require_relative 'display'

# Handles general game flow.
class Game
  include Display

  def initialize
    @checker = AnswerChecker.new
    new_game
  end

  def new_game
    @incorrect_guesses = 0
    @checker.new_word
    @checker.display_state(@incorrect_guesses)
    @player = PlayerInput.new
    @game_over = false
    play_turn
  end

  def play_turn
    guess = @player.guess
    @checker.correct_guess?(guess) ? correct_guess(guess) : incorrect_guess
    return if @game_over == true

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
    status == 'win' ? Display.win : Display.lose(@checker.secret_word)
  end
end

Game.new
