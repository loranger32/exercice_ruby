require 'date'

class Meetup
  DAYS = { first: 0, second: 1, third: 2, fourth: 3, last: -1, teenth: :teenth } 

  def initialize(month, year)
    @days = generate_all_days_of_month(month, year)
  end

  def day(weekday, descriptor)
    if descriptor == :teenth
      # select only the days ranging from 13th to 19th of month
      @days.to_a[12..18].find { |day| day.send("#{weekday}?") }
    else
      good_days = @days.select { |day| day.send("#{weekday}?") }
      good_days[DAYS[descriptor]]
    end
  end

  private

  def generate_all_days_of_month(month, year)
    first_day_of_month = Date.new(year, month)
    last_day_of_month = Date.new(year, month).next_month - 1
    first_day_of_month..last_day_of_month
  end
end

module BookKeeping
  VERSION = 1
end
