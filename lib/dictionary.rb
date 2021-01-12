# frozen_string_literal: true

# Parses the dictionary and prunes it for words of appropriate length
class Dictionary
  attr_reader :word

  def initialize
    @word = File.open('5desk.txt', 'r')
                .read
                .split
                .select! { |word| word.length.between?(5, 12) }
                .sample
  end
end
