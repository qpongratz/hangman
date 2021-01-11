# frozen_string_literal: true

require_relative 'display'

# Gets player input and checks if valid.
class PlayerInput
  include Display
  attr_reader :guesses

  def initialize
    @guesses = []
  end

  def guess
    Display.guess_prompt
    letter = gets.chomp.downcase
    if valid?(letter)
      @guesses.push(letter)
      @letter = letter
    else
      Display.invalid_input
      guess
    end
  end

  def display_guesses
    Display.guesses(@guesses)
  end

  private

  def valid?(letter)
    letter.between?('a', 'z') &&
      letter.length == 1 &&
      !@guesses.include?(letter)
  end
end
