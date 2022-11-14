class Cipher
  class Error < StandardError; end

  CHARS = ('a'..'z').to_a.freeze

  attr_reader :key

  def initialize(key=nil)
    @key = key.nil? ? generate_random_key : validate_key(key)
  end

  def encode(input)
    process_rotation(input, :encode)
  end

  def decode(input)
    process_rotation(input, :decode)
  end

  private

  def current_char_index(char)
    CHARS.index(char)
  end

  def generate_random_key
    100.times.with_object("") { _2 << CHARS[rand(26)] }
  end

  def process_rotation(input, operation)
    operator = retrieve_operation(operation)
    input.chars.map.with_index do |char, index|
      CHARS[(current_char_index(char).send(operator, rotatation_step(index))) % 26]
    end.join
  end

  def retrieve_operation(operation)
    case operation
    when :encode then :+
    when :decode then :-
    else
      raise Error, "Invalid operation provided"
    end
  end

  def rotatation_step(key_index)
    CHARS.index(@key[key_index])
  end

  def validate_key(key)
    raise ArgumentError unless key.match?(/\A[a-z]+\z/)
    key
  end
end
