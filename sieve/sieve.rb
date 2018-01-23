class Sieve
  def initialize(integer)
    @numbers = (2..integer).to_a
  end

  def primes
    return [] if @numbers.empty?
    @numbers.each do |divisor|
      @numbers.delete_if do |prime_candidate|
        (prime_candidate % divisor).zero? && prime_candidate != divisor
      end
    end
    @numbers
  end
end

class BookKeeping
  VERSION = 1
end

