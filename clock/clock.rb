class Clock
  def self.at(hours, minutes)
    new(hours, minutes)
  end

  def initialize(hours, minutes)
    @hours = (hours + (minutes / 60)) % 24
    @minutes = minutes % 60
    @formatted_time = to_s
  end

  def +(minutes)
    sup_hours, sup_minutes = minutes.divmod(60)
    self.class.new(@hours + sup_hours, @minutes + sup_minutes)
  end

  def ==(other)
    formatted_time == other.formatted_time
  end

  def to_s
    format("%2.2d:%2.2d", @hours, @minutes)
  end

  protected

  attr_reader :formatted_time, :hours, :minutes
end

module BookKeeping
  VERSION = 2
end
