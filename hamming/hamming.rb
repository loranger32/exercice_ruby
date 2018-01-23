class Hamming
  def self.compute(first, second)
    raise ArgumentError unless first.size == second.size
    first.each_char.with_index.count do |_, index|
      first[index] != second[index]
    end
  end
end

module BookKeeping
  VERSION = 3
end
