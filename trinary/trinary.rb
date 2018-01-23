class Trinary
  def initialize(trinary_number)
    @input = trinary_number
  end

  def to_decimal
    validate(@input).map.with_index { |num, index| num * (3**index) }.sum
  end

  private

  def validate(input)
    input.match?(/\A[012]+\z/) ? input.to_i.digits : [0]
  end
end

module BookKeeping
  VERSION = 1
end
