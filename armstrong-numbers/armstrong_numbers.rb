module ArmstrongNumbers
  def self.include?(number)
    digits = number.digits
    power = digits.size
    number == digits.sum { _1**power }
  end
end
