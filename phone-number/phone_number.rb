class PhoneNumber
  def self.clean(phone_number)
    digits = only_digits(phone_number)
    return digits if valid_number?(digits)
  end

  def self.only_digits(phone_number)
    phone_number.each_char.select { |char| char.match?(/\d/) }.join.delete_prefix('1')
  end

  def self.valid_number?(digits)
    digits.size == 10 && digits[0].to_i > 1 && digits[3].to_i > 1
  end
end

module BookKeeping
  VERSION = 2
end
