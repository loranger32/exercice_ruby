class Clock
  def self.at(hours, minutes)
    new((hours * 60) + minutes)
  end

  def initialize(minutes)
    @minutes = minutes % (24 * 60)
  end

  def +(minutes)
    self.class.new(@minutes + minutes)
  end

  def ==(other)
    to_s == other.to_s
  end

  def to_s
    format("%2.2d:%2.2d" % @minutes.divmod(60))
  end
end

module BookKeeping
  VERSION = 2
end
