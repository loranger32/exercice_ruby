class Cipher
  KEYS = ('a'..'z').to_a.freeze

  attr_reader :key

  def initialize(key)
    validate_key(key)
    @key = key
  end

  private

  def validate_key(key)
    raise ArgumentError unless key.match?(/\A[a-z]+\z/)
  end
end
