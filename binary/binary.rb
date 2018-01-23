class Binary
  def self.to_decimal(binary)
    raise ArgumentError unless binary.match?(/^[01]+$/)
    binary.to_i.digits.map.with_index { |digit, power| digit*(2**power) }.reduce(:+)
  end
end

class BookKeeping
  VERSION = 3
end
