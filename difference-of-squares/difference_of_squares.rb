class Squares
  attr_reader :numbers

  def initialize(int)
    @numbers = (1..int).to_a
  end

  def square_of_sum
    numbers.reduce(:+)**2
  end

  def sum_of_squares
    numbers.map { |num| num ** 2 }.reduce(:+)
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 4
end
