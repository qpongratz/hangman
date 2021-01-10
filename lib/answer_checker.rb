# frozen_string_literal: true

require_relative 'dictionary'

# Keeps track of secret word and checks guessed letters
class AnswerChecker
  def initialize
    @word_list = Dictionary.new.dictionary
  end

  def new_word
    @secret_word = @word_list.sample.split('')
    @answer_state = Array.new(@secret_word.length, '_')
  end

  def update_answer_state(guessed_letter)
    @secret_word.each_with_index do |letter, index|
      @answer_state[index] = letter if guessed_letter == letter.downcase
    end
    @answer_state
  end

  def correct_guess?(guess)
    @secret_word.include?(guess)
  end

  def solved?
    @answer_state.none?('_')
  end

  def display_new_state
    Display.state(@answer_state)
  end
end
