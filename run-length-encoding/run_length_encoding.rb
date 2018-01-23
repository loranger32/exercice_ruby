class RunLengthEncoding
  def self.encode(input)
    result = ''
    counter = 1
    input.each_char.with_index do |char, index|
      if input[index + 1] == char
        counter += 1
      else
        if counter > 1
          result << "#{counter}#{char}"
          counter = 1
        else
          result << char
        end
      end
    end
    result
  end

  def self.decode(input)
    result = ''
    factor = []
    input.each_char.with_index do |char, index|
      if char.match?(/\d/)
        factor << char
      else
        if !factor.empty?
          result << char * (factor.join.to_i)
          factor = []
        else
          result << char
        end
      end
    end
    result
  end
end

class BookKeeping
  VERSION = 3
end
