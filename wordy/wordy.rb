class TokenError < StandardError; end

class ProblemDescriptionValidator

  FIRST_WORDS = "What is ".freeze
  LAST_TOKEN = '?'.freeze
  VALID_TOKENS = /\d+|\s+|plus|minus|multiplied|divided|by|-/i

  def initialize(problem_in_words)
    check_begin_and_end_of(problem_in_words)
    @input = extract_core_data_from(problem_in_words)
  end

  def validate_and_extract_data
    validate_input
    @input
  end

  private

  def check_begin_and_end_of(problem_in_words)
    error_msg = "Problem description must start with 'What is ' and end with '?'"
    raise ArgumentError,  error_msg unless \
      problem_in_words.start_with?(FIRST_WORDS) &&
        problem_in_words.end_with?(LAST_TOKEN)
  end

  def extract_core_data_from(problem)
    problem.delete_prefix(FIRST_WORDS).chop
  end

  def validate_input
    @input.split.each do |token|
      raise TokenError, "Token: '#{token}' is invalid" unless token.match?(VALID_TOKENS)
    end
  end
end

class Tokenizer
  def initialize(input)
    @input = input.split.delete_if { |token| token == 'by' }
  end

  def tokenize
    converted_tokens = []
    @input.each do |token|
      if token.match?(/\d+/)
        converted_tokens << token.to_i
      else
        converted_tokens << convert_operation_symbol(token)
      end
    end
    converted_tokens
  end

  private

  def convert_operation_symbol(token)
    case token
    when 'plus'       then :+
    when 'minus'      then :-
    when 'multiplied' then :*
    when 'divided'    then :/
    else
      raise TokenError, "Unrecognized token: #{token}."
    end
  end
end

class Processor
  def initialize(tokens)
    @tokens = tokens
  end

  def process
    # Initialize the result with te first number
    result = @tokens.shift

    # In each slice of two elements, the first is the operation the second the operand 
    @tokens.each_slice(2) do |slice|
      result = result.send(slice[0], slice[1])
    end
    result
  end
end

class WordProblem
  def initialize(problem_in_words)
    validator = ProblemDescriptionValidator.new(problem_in_words)
    @input = validator.validate_and_extract_data

    @tokens = Tokenizer.new(@input).tokenize
  end

  def answer
    processor = Processor.new(@tokens)
    processor.process
  end
end
