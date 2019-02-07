class WordProblem
  VALID_TOKENS = /\d+|\s+|plus|minus|multiplied|divided|-/i
  COMMANDS = { "plus" => '+', 'minus' => '-', 'multiplied' => '*', 'divided' => '/' }

  def initialize(problem_in_words)
    @tokens = problem_in_words.chop.split.keep_if { |token| token.match? VALID_TOKENS }.map { |token| COMMANDS[token] ? COMMANDS[token] : token }
    @wrong_input = problem_in_words.chop.split.any? { |token| !token.match?(VALID_TOKENS) && !token.match?(/What|is|by/) }
  end

  def answer
    raise ArgumentError if @wrong_input
    result = @tokens.shift
    @tokens.each_slice(2) { |slice| result = eval "#{result} #{slice.join(' ') }" }
    result
  end
end
