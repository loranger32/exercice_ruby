class Hexadecimal
  HEXADECIMAL_VALUES = "0123456789abcdef"

  def initialize(str)
    @hexadecimal =  str.match?(/\A[0-9a-f]+\z/) ? str : "0"
  end

  def to_decimal
    @hexadecimal.reverse.each_char.map.with_index do |char, index|
      HEXADECIMAL_VALUES.index(char) * 16**index
    end.sum
  end
end
