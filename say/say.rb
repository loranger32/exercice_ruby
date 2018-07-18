class Say
  UNITS = %w[zero one two three four five six seven eight nine ten eleven
             twelve thirteen fourteen fifteen sixteen seventeen eighteen
             nineteen].freeze
  
  TENS = %w[nil nil twenty thirty forty fifty sixty seventy eighty ninety].freeze

  MAGNITUDES = %w[nil thousand million billion]


  def initialize(number)
    @original_number = validate(number)
    @arrays_of_numbers = digitize(number)
  end

  def in_english
    return 'zero' if @original_number == 0
    english_parts = @arrays_of_numbers.map do |serie|
      number = make_number_from(serie)
      if number != 0
        one_to_nine_hundred_ninety_nine(number)
      else
        ''
      end
    end
    english_parts.each_with_index do |part, index|
      part << " #{MAGNITUDES[index]}" unless index == 0 || part == ''
    end

    english_parts.reverse.join(' ').strip
  end

  private

  def one_to_ninety_one(num)
    if num < 20
      UNITS[num]
    elsif num < 100
      digits = num.digits
      result = "#{TENS[digits[1]]}"
      result << "-#{UNITS[digits[0]]}" unless digits[0] == 0
      result
    end
  end

  def one_to_nine_hundred_ninety_nine(number)
    result = ''
    hundreds, tens_and_units = number.divmod(100)

    hundred_english = UNITS[hundreds] + " hundred" unless hundreds == 0
    tens_and_units_english = one_to_ninety_one(tens_and_units) unless tens_and_units == 0

    result << hundred_english if hundred_english
    result << ' ' if tens_and_units_english && hundred_english
    result << tens_and_units_english if tens_and_units_english

    result
  end

  def digitize(number)
    validate(number)
    number.digits.each_slice(3).to_a.map(&:reverse)
  end

  def make_number_from(array_of_numbers)
    coefficient = 10**array_of_numbers.size
    array_of_numbers.inject(0) do |acc, number|
      coefficient /= 10
      acc + (number * coefficient)
    end
  end

  def validate(number)
    if number < 0 || number > 999_999_999_999
      raise ArgumentError, 'Number is out of range.'
    elsif !number.is_a?(Integer)
      raise ArgumentError, 'Input must be an Integer'
    else
      number
    end
  end
end

module BookKeeping
  VERSION = 1
end
