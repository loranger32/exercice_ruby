class Clock
  attr_reader :formatted_time

  def self.at(hours, minutes)
    new(hours, minutes)
  end

  def initialize(hours, minutes)
    @hours = (hours + (minutes / 60)) % 24
    @minutes = minutes % 60
  end

  def format(*time)
    hours = sprintf("%2.2d", time[0])
    minutes = sprintf("%2.2d", time[1])
    "#{hours}:#{minutes}"
  end

  def +(minutes)
    sup_hours, sup_minutes = minutes.divmod(60)
    self.class.new(@hours + sup_hours, @minutes + sup_minutes)
  end

  def ==(other)
    @hours == other.hours && @minutes == other.minutes
  end

  def to_s
    format(@hours, @minutes)
  end

  protected

  attr_reader :hours, :minutes
end

module BookKeeping
  VERSION = 2
end

p Clock.at(8, 0)
