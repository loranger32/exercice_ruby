module PrimeFactors
  def self.for(int)
    result = []
    quotient = int
    prime_divisor = 2

    until quotient == 1
      if (quotient % prime_divisor).zero?
        result << prime_divisor
        quotient /= prime_divisor
      else
        prime_divisor += 1
      end
    end

    result
  end
end
