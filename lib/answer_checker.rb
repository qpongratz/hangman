# frozen_string_literal: true

require_relative 'dictionary'
require_relative 'display'
require 'pry'

# Keeps track of secret word and checks guessed letters
class AnswerChecker
  include Display
  include FileReader
  attr_reader :secret_word

  def initialize
    @secret_word = make_word.split('')
    @answer_state = Array.new(@secret_word.length, '_')
  end

  def update_answer_state(guessed_letter)
    @secret_word.each_with_index do |letter, index|
      @answer_state[index] = letter if guessed_letter == letter.downcase
    end
    @answer_state
  end

  def correct_guess?(guess)
    @secret_word.include?(guess) || @secret_word.include?(guess.upcase)
  end

  def solved?
    @answer_state.none?('_')
  end

  def display_state(incorrect_guesses)
    Display.state(@answer_state, incorrect_guesses)
  end
end
