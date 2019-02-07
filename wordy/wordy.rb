require 'pry'

class WordProblem
  FIRST_WORDS = "What is ".freeze
  TOKENS = /\d+|\s+|plus|\?|-/i

  attr_reader :problem_in_words

  def initialize(problem_in_words)
    @problem_in_words = problem_in_words
    valid_input?(problem_in_words)
  end

  def answer

  end

  private

  def valid_input?(problem_in_words)
    raise ArgumentError unless begins_with_correct_words? && valid_tokens?
  end

  def begins_with_correct_words?
    problem_in_words.start_with?(FIRST_WORDS)
  end

  def valid_tokens?
    problem_in_words.delete(FIRST_WORDS).split.each do |char|
      binding.pry
      return false unless char.match?(TOKENS)
    end
    true
  end
end

p WordProblem.new("What is 1 plus 1 and?")