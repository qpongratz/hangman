# frozen_string_literal: true

# Handles displaying text
module Display
  def self.guesses(guess_array)
    p guess_array.join(', ')
  end

  def self.state(state_array, incorrect_guesses)
    puts "Number wrong times: #{incorrect_guesses}"
    p state_array.join(' ')
  end

  def self.correct
    puts 'correct'
  end

  def self.incorrect
    puts 'incorrect'
  end

  def self.guess_prompt
    puts 'what letter you wnat'
  end

  def self.invalid_input
    puts 'aint no letter'
  end
end
