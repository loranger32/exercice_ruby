class Luhn
  def self.valid?(number)
    new(number).valid?
  end

  def initialize(number)
    @number = number.delete(" ")
  end

  def valid?
    return false unless only_digits?
    checksum % 10 == 0
  end

  private

  def only_digits?
    @number.match?(/\A\d{2,}\z/)
  end

  def checksum
    @number.to_i.digits.each_slice(2).sum { compute_pair _1 }
  end

  def compute_pair(pair)
    return pair.first if pair.count == 1
    
    pair.first + double(pair.last)
  end

  def double(digit)
    digit * 2 < 9 ? digit * 2 : digit * 2 - 9
  end
end 