class BirdCount
  def self.last_week
    new([0, 2, 5, 3, 7, 8, 4]).birds_per_day
  end

  attr_reader :birds_per_day
  
  def initialize(birds_per_day)
    @birds_per_day = birds_per_day
  end

  def yesterday
    birds_per_day[-2]
  end

  def total
    birds_per_day.reduce(:+)
  end

  def busy_days
    birds_per_day.count { _1 >= 5 }
  end

  def day_without_birds?
    birds_per_day.any? { _1.zero? }
  end
end
