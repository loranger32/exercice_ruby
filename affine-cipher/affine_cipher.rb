class Affine

  ALPHABET = ('a'..'z').to_a
  ALPHABET_SIZE = 26

  def initialize(first_key, second_key)
    @first_key = validate_first_key(first_key)
    @second_key = second_key
    @mmi = compute_mmi(@first_key, ALPHABET_SIZE)
    @encoding = Proc.new { |token| ((token * @first_key) + @second_key) % ALPHABET_SIZE }
    @decoding = Proc.new { |token| (@mmi * (token - @second_key)) % ALPHABET_SIZE }
  end

  def encode(string)
    characters = string.downcase.scan(/[a-z]|\d/i)
    raw_conversion = characters.map { |char| convert_with(char, @encoding) }
    format_cipher_text(raw_conversion)
  end

  def decode(string)
    string.scan(/[a-z]|\d/i).map { |char| convert_with(char, @decoding) }.join('')
  end

  private

  def validate_first_key(key)
    if ALPHABET_SIZE.gcd(key) == 1
      key
    else
      raise ArgumentError, "Error, a and m must be coprimes"
    end
  end

  def convert_with(char, operation)
    return char if char.match?(/\d/)
  
    converted_token = operation.call(ALPHABET.index(char))
    ALPHABET[converted_token]
  end

  def format_cipher_text(raw_text)
    formatted_output = ''
    raw_text.each_with_index do |char, index|
      formatted_output << ' ' if index % 5 == 0 && index != 0
      formatted_output << char
    end
    formatted_output
  end

  def compute_mmi(first_value, modulo_value)
    mmi = 1
    while ((first_value * mmi) % modulo_value) != 1
      mmi += 1
    end
    mmi
  end
end
