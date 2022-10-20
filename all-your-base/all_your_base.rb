require "pry"

class BaseConverter
  def self.convert(...)
    new(...).convert
  end

  def initialize(input_base, digits, output_base)
    validate_args(input_base, digits, output_base)
    @input_base = input_base
    @digits = digits
    @output_base = output_base
  end

  def convert
    base_10_as_array = base_10_digits
    return base_10_as_array if @output_base == 10 || base_10_as_array.all? { _1.zero? }
    
    number_to_process = base_10_number(base_10_as_array)
    
    output_base_digits = []
    
    while !number_to_process.zero? do
      number_to_process, remainder = number_to_process.divmod(@output_base)
      output_base_digits << remainder
    end

    output_base_digits.reverse
  end

  private

  def base_10_number(base_10_as_array)
    base_10_as_array.map(&:to_s).join.to_i
  end

  def base_10_digits_array(number)
    number.to_s.split('').map(&:to_i)
  end

  def base_10_digits
    power = @digits.size - 1
    acc = 0
    @digits.each do |digit|
      acc += digit * @input_base**power
      power -= 1
    end
    base_10_digits_array(acc)
  end

  def validate_args(input_base, digits, output_base)
    validate_bases(input_base, output_base)
    validate_digits(digits, input_base)
  end

  def validate_bases(*inputs)
    raise ArgumentError if inputs.any? { _1 < 2 }
  end

  def validate_digits(digits, input_base)
    raise ArgumentError if digits.any? { _1 >= input_base || _1.negative? }
  end
end