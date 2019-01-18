class Series
  def initialize(string)
    raise ArgumentError if string.match?(/[a-z]/i)
    @digits = string.chars.map(&:to_i)
  end

  def largest_product(slice_length)
    return 1 if slice_length.zero?
    return 0 if digits_are_all_zeros?
    
    validate_arguments(slice_length)
    
    compute_max_product(slice_length)
  end

  private

  attr_reader :digits

  def digits_are_all_zeros?
    !digits.empty? && digits.all? { |digit| digit == 0 }
  end

  def validate_arguments(slice_length)
    raise ArgumentError if argument_bigger_than_string_size?(slice_length) ||
      empty_string_and_nonzero_span?(slice_length) || slice_length < 0
  end

  def empty_string_and_nonzero_span?(slice_length)
    digits.empty? && slice_length > 0
  end

  def argument_bigger_than_string_size?(slice_length)
    slice_length > digits.size
  end

  def compute_max_product(slice_length)
    result = []
    digits.each_cons(slice_length) do |serie|
      result << serie.reduce(:*)
    end
    result.max
  end
end