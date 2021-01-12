# frozen_string_literal: true

# Parses the dictionary and prunes it for words of appropriate length
module FileReader
  def make_name
    File.open('names.txt', 'r')
        .read
        .split
        .sample
  end

  def make_word
    File.open('5desk.txt', 'r')
        .read
        .split
        .select! { |word| word.length.between?(5, 12) }
        .sample
  end

end
