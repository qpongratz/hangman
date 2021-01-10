# frozen_string_literal: true

# Parses the dictionary and prunes it for words of appropriate length
class WordPicker
  attr_reader :dictionary

  def initialize
    @dictionary = File.open('5desk.txt', 'r').read.split
    @dictionary.select! { |word| word.length.between?(5, 12) }
  end
end
