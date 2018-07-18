require 'set'

class Palindrome
  attr_reader :value, :factors

  def initialize(factors, value)
    @factors = factors.map(&:sort).uniq
    @value   = value
  end
end

class Palindromes
  attr_accessor :palindromes

  def initialize(factors)
    @min_factor  = factors[:min_factor] || 1
    @range       = @min_factor..factors[:max_factor]
    @palindromes = Hash.new { |hash, key| hash[key] = [] }
  end

  def generate
    @range.to_a.product(@range.to_a) do |factors|
      value = factors.reduce(:*)
      palindromes[value] << factors if value.to_s == value.to_s.reverse
    end
  end

  def largest
    max_value = palindromes.keys.max
    Palindrome.new(palindromes[max_value], max_value)
  end

  def smallest
    min_value = palindromes.keys.min
    Palindrome.new(palindromes[min_value], min_value)
  end
end
