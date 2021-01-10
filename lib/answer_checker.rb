# frozen_string_literal: true

require_relative 'dictionary'

# Keeps track of secret word and checks guessed letters
class AnswerChecker
  attr_reader :secret_word

  def initialize
    @word_list = Dictionary.new.dictionary
    new_word
  end

  def new_word
    @secret_word = @word_list.sample.split('')
    @answer_state = Array.new(@secret_word.length, '_')
  end

  def check_letter(guessed_letter)
    @secret_word.each_with_index do |letter, index|
      @answer_state[index] = letter if guessed_letter == letter.downcase
    end
    @answer_state
  end

  def solved?
    @answer_state.include?('_') ? false : true
  end
end

answer = AnswerChecker.new
p answer.secret_word
p answer.check_letter('a')
p answer.check_letter('b')
p answer.check_letter('c')
p answer.check_letter('d')
p answer.check_letter('e')
p answer.check_letter('f')
p answer.check_letter('g')
p answer.check_letter('h')
p answer.check_letter('i')
p answer.check_letter('j')
p answer.check_letter('k')
p answer.check_letter('l')
p answer.check_letter('m')
p answer.check_letter('n')
p answer.check_letter('o')
p answer.check_letter('p')
p answer.check_letter('t')
p answer.check_letter('s')
p answer.check_letter('r').join
p answer.solved?
answer.new_word
p answer.solved?

