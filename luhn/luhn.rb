module Luhn
  module_function

  def valid?(string_number)
    formatted_string = format_string(string_number)
    return false if invalid_string?(formatted_string)
    
    checksum = calculate_checksum_from(formatted_string)
    valid_checksum?(checksum)
  end

  def format_string(string_number)
    string_number.gsub(/\s/, '')
  end

  def invalid_string?(formatted_string)
    one_digit_only?(formatted_string) || has_a_non_digit_character?(formatted_string)
  end

  def one_digit_only?(formatted_string)
    formatted_string.size <= 1
  end

  def has_a_non_digit_character?(formatted_string)
    formatted_string.match?(/\D/)
  end

  def calculate_checksum_from(formatted_string)
    # 1. Convert string to reversed array of integers
    # 2. Doubble every other digit from the right
    # 3. substract 9 from digit if it is greater than 9
    # 4. return the sum of all digits
    formatted_string.to_i.digits.map.with_index do |digit, index|
      if index.odd?
        digit *= 2
        digit > 9 ? digit - 9 : digit
      else
        digit
      end
    end.sum
  end

  def valid_checksum?(checksum)
    checksum % 10 == 0
  end
end
