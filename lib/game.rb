# frozen_string_literal: true

require_relative 'answer_checker'
require_relative 'player_input'
require_relative 'display'

# Handles general game flow.
class Game
  def initialize
    @checker = AnswerChecker.new
    new_game
  end

  def new_game
    @incorrect_guesses = 0
    @checker.new_word
    @player = PlayerInput.new
    @game_over = false
    # display initial state
  end

  def play_turn
    guess = @player.guess
    @checker.correct_guess?(guess) ? correct_guess(guess) : incorrect_guess
    unless @game_over == true
      @checker.display_new_state
      play_turn
    end
  end

  def incorrect_guess
    @incorrect_guesses += 1
    end_game('lose') if @incorrect_guesses > 5
  end

  def correct_guess
    answer_state = @checker.update_answer_state(guess)
    end_game('win') if @checker.solved?
  end

  def end_game(state)
    @game_over = true

end
