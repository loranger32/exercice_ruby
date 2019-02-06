class Luhn
  attr_reader :stripped_string, :has_invalid_input, :checksum

  def initialize(string_number)
    @stripped_string = string_number.gsub(/\s/, '')
    @has_invalid_input = invalid_syntax?
    @checksum = calculate_checksum  
  end

  def self.valid?(string_number)
    validator = new(string_number)
    return false if validator.has_invalid_input

    validator.valid_checksum?
  end

  def invalid_syntax?
    one_digit_only? || has_a_non_digit_character?
  end

  def one_digit_only?
    stripped_string.size <= 1
  end

  def has_a_non_digit_character?
    stripped_string.match?(/\D/)
  end

  def calculate_checksum
    # 1. Convert string to reversed array of integers
    # 2. Doubble every other digit from the right
    # 3. substract 9 from digit if it is greater than 9
    # 4. return the sum of all digits
    stripped_string.to_i.digits.map.with_index do |digit, index|
      if index.odd?
        digit *= 2
        digit > 9 ? digit - 9 : digit
      else
        digit
      end
    end.reduce(:+)
  end

  def valid_checksum?
    checksum % 10 == 0
  end
end
