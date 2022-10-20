class IsbnVerifier
  def self.valid?(string)
    new(string).valid?
  end

  def initialize(string)
    @string = string.delete("-")
  end

  def valid?
    return false if invalid_length? || invalid_char?  
        
    checksum % 11 == 0
  end

  private

  def checksum
    sum = compute_9_first_digits
    sum += last_digit
  end 

  def compute_9_first_digits
    sum = 0

    @string.chars[0..-2].map(&:to_i).each_with_index do |digit, index|
      sum += digit * (10 - index)
    end

    sum
  end

  def last_digit
    @string[-1] == "X" ? 10 : @string[-1].to_i
  end

  def invalid_length?
    @string.size != 10
  end

  def invalid_char?
    !@string.match?(/\A\d{9}[\d|X]\z/i)
  end
end


