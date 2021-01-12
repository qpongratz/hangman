# frozen_string_literal: true

require_relative 'answer_checker'
require_relative 'player_input'
require_relative 'display'
require_relative 'save_handler'
require 'yaml'
require 'date'

# Handles general game flow.
class Game
  include Display
  include SaveSystem
  attr_reader :file_name

  def start_game
    @player = PlayerInput.new
    @checker = AnswerChecker.new
    @incorrect_guesses = 0
    @checker.display_state(@incorrect_guesses)
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

  def resume_game
    Display.welcome(@player.player_name)
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

  # def save_game
  #   @file_name = "#{@player.player_name}-#{DateTime.now}.yml"
  #   save_variables = {}
  #   instance_variables.map do |var|
  #     save_variables[var] = instance_variable_get(var)
  #   end
  #   Dir.mkdir('saves') unless File.exist? 'saves'
  #   File.open("saves/#{file_name}", 'w') { |save| save.print(YAML.dump(save_variables)) }
  # end

  # def load_game(file_name)
  #   loaded_variables = YAML.load(File.open("saves/#{file_name}", 'r').read)
  #   loaded_variables.each do |key, value|
  #     instance_variable_set(key, value)
  #   end
  #   resume_game
  # end
end
