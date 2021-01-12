# frozen_string_literal: true

require_relative 'answer_checker'
require_relative 'player_input'
require_relative 'display'
require 'yaml'
require 'date'

# Handles general game flow.
class Game
  include Display

  def initialize
    @checker = AnswerChecker.new
    new_game
  end

  def new_game
    @incorrect_guesses = 0
    @player = PlayerInput.new
    @checker.new_word
    @checker.display_state(@incorrect_guesses)
    @game_over = false
    # play_turn
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

  def save_game
    file_name = "#{@player.player_name}-#{DateTime.now}.yml"
    save_variables = {}
    instance_variables.map do |var|
      save_variables[var] = instance_variable_get(var)
    end
    Dir.mkdir('saves') unless File.exist? 'saves'
    File.open("saves/#{file_name}", 'w') { |save| save.print(YAML.dump(save_variables)) }
  end
end

hello = Game.new
hello.save_game
