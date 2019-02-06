class Affine
  attr_reader :first_key, :second_key
  
  ALPHABET_VALUE_MAPPING = ('a'..'z').to_a
  ALPHABET_LENGTH = 26

  def initialize(first_key, second_key)
    @first_key = first_key
    @second_key = second_key
    validate_first_key
  end

  def encode(string)
    characters = string.downcase.scan(/[a-z]|\d/i)
    raw_conversion = characters.map { |char| encode_character(char) }
    format_cipher_text(raw_conversion)
  end

  def decode(string)
    characters = string.downcase.scan(/[a-z]|\d/i)
    characters.map { |char| decode_character(char) }.join('')
  end

  private

  def validate_first_key
    raise ArgumentError, "Error, a and m must be coprimes" unless ALPHABET_LENGTH.gcd(first_key) == 1
  end

  def encode_character(char)
    return char if char.match?(/\d/)
  
    token = ALPHABET_VALUE_MAPPING.index(char)
    converted_token = ((token * first_key) + second_key) % ALPHABET_LENGTH
    ALPHABET_VALUE_MAPPING[converted_token]
  end

  def format_cipher_text(raw_text)
    formatted_output = ''
    raw_text.each_with_index do |char, index|
      formatted_output << ' ' if index % 5 == 0 && index != 0
      formatted_output << char
    end
    formatted_output
  end

  def decode_character(char)
    mmi = compute_mmi(first_key, ALPHABET_LENGTH)
    return char if char.match?(/\d/)

    token = ALPHABET_VALUE_MAPPING.index(char)
    converted_token = (mmi * (token - second_key)) % ALPHABET_LENGTH
    ALPHABET_VALUE_MAPPING[converted_token]
  end

  def compute_mmi(first_value, modulo_value)
    mmi = 1
    while ((first_value * mmi) % modulo_value) != 1
      mmi += 1
    end
    mmi
  end
end
