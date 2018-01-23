class Prime
  def self.nth(integer)
    raise ArgumentError, "Nth number cannot lesser than 1" if integer < 1
    counter = 0
    current_number = 2
    loop do
      counter += 1 if is_prime?(current_number)
      break current_number if counter >= integer
      current_number += 1
    end
  end

  def self.is_prime?(integer)
    2.upto(integer / 2).to_a.none? { |divisor| (integer % divisor).zero? }
  end
end

class BookKeeping
  VERSION = 1
end
