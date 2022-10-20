module CollatzConjecture
  def self.steps(integer)
    raise ArgumentError if integer <= 0

    counter = 0
    while integer != 1
      integer = integer.even? ? integer / 2 : (integer * 3 + 1)
      counter += 1
    end
    counter
  end
end
