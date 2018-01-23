class Grains
  NUMBER_OF_SQUARES = 64

  def self.square(number)
    raise ArgumentError unless (1..NUMBER_OF_SQUARES) === number
    (2**(number - 1))
  end

  def self.total
    (2**NUMBER_OF_SQUARES) - 1
  end
end

class BookKeeping
  VERSION = 1
end
