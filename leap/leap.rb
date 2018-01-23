class Year
  def self.leap?(year)
    (year % 400).zero? || ((year % 4).zero? && !(year % 100).zero?)
  end
end

class BookKeeping
  VERSION = 3
end

p Year.leap?(2200)
