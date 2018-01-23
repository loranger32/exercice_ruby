class Integer
  ROMAN = [['I', 'V'], ['X', 'L'], ['C', 'D'], ['M']]

  def to_roman
    digits.each_with_index.with_object('') do |(number, index), roman|
      next if number.zero?
      case number
      when 1..3
        roman.prepend(ROMAN[index][0] * number)
      when 4
        roman.prepend(ROMAN[index][0] + ROMAN[index][1])
      when 5
        roman.prepend(ROMAN[index][1])
      when 6..8
        roman.prepend(ROMAN[index][1] + ROMAN[index][0] * (number - 5))
      when 9
        roman.prepend(ROMAN[index][0] + ROMAN[index + 1][0])
      end
    end
  end
end

class BookKeeping
  VERSION = 2
end
