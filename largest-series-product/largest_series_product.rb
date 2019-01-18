class Series
  def initialize(string)
    raise ArgumentError if string.match?(/\D/)
    @digits = string.chars.map(&:to_i)
  end

  def largest_product(span)
    return 1 if span.zero?
    validate_arguments(span)
    compute_max_product(span)
  end

  private

  attr_reader :digits

  def validate_arguments(span)
    raise ArgumentError if argument_bigger_than_string_size?(span) ||
      empty_string_and_nonzero_span?(span) || span < 0
  end

  def argument_bigger_than_string_size?(span)
    span > digits.size
  end

  def empty_string_and_nonzero_span?(span)
    digits.empty? && span > 0
  end

  def compute_max_product(span)
    digits.each_cons(span).map { |serie| serie.reduce(:*) }.max
  end
end