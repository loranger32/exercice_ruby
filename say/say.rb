class Say
  UNITS = %w[zero one two three four five six seven eight nine ten eleven
             twelve thirteen fourteen fifteen sixteen seventeen eighteen
             nineteen].freeze
  
  TENS = %w[nil nil twenty thirty fourty fifty sixty seventy eighty ninety].freeze


  def initialize(number)
    @number = validate(number)
  end

  def in_english
    if @number < 20
      UNITS[@number]
    elsif @number < 100
      digits = @number.digits
      "#{TENS[digits[1]]}-#{UNITS[digits[0]]}"
    elsif @number < 1000
      digits = @number.digits
      "#{UNITS[digits[2]]} hundred and #{TENS[digits[1]]}-#{UNITS[digits[0]]}"
    end
  end

  private

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
