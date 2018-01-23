class SumOfMultiples
  attr_reader :factors

  def initialize(*factors)
    @factors = factors
  end

  def to(int)
    return 0 if int < 2 || factors.empty?
    (1...int).each_with_object([]) do |num, result|
      factors.each do |factor|
        result << num if (num % factor).zero?
      end
    end
    .uniq
    .sum
  end
end

class BookKeeping
  VERSION = 2
end
