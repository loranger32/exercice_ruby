module TwelveDays
  module_function

  DAYS = %w[first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth].freeze
  GIFTS = ["a Partridge in a Pear Tree",
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
    "twelve Drummers Drumming"
  ].freeze

  def song
    lyrics = ""
    12.times do |i|
      lyrics << first_part(i)
      lyrics << second_part(i)
      lyrics << new_lines(i)
    end
    lyrics
  end

  def first_part(day)
    "On the #{DAYS[day]} day of Christmas my true love gave to me: "
  end

  def new_lines(i)
    i == 11 ? ".\n" : ".\n\n"
  end

  def second_part(day)
    gifts = GIFTS[0..day].reverse.join(", ")
    gifts.sub!(", a", ", and a") if day > 0
    gifts
  end
end
