# frozen_string_literal: true

# Gets player input and checks if valid.
class PlayerInput
  attr_reader :guesses

  def initialize
    @guesses = []
  end

  def guess
    puts 'What letter would you like to guess?'
    letter = gets.chomp.downcase
    if valid?(letter)
      @guesses.push(letter)
      @letter = letter
    else
      puts 'Invalid guess.'
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
