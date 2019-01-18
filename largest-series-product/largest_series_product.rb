class Series
  attr_reader :digits

  def initialize(string)
    raise ArgumentError if string.match?(/[a-z]/i)
    @digits = string.to_i.digits.reverse
  end

  def largest_product(int)
    return 0 if digits == [0]
    
    check_arguments(int)
      
    result = []
    digits.each_cons(int) do |serie|
      result << serie.reduce(:*)
    end
    result.max
  end

  private

  def check_arguments(int)
    raise ArgumentError if argument_bigger_than_string_size?(int) ||
      empty_string_and_nonzero_span?(int) || int < 0
  end

  def empty_string_and_nonzero_span?(int)
    digits == [] && int > 0
  end

  def argument_bigger_than_string_size?(int)
    int > digits.size
  end
end

#invalid_character_in_digits

p a = Series.new('')

#p a.digits.each_cons(3) { |g| p g.reduce(:*) }