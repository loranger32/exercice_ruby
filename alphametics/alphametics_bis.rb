module BookKeeping
  VERSION = 4
end

class Alphametics
  def self.solve(input)
    new(input).solve || {}
  end

  def initialize(input)
    @input = input
    @chars = (leading_chars + non_leading_chars).uniq
  end

  def solve
    target_digits =
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        .permutation(@chars.count)
        .select { |digits| no_leading_zeroes?(digits) }
        .find { |digits| solution?(digits) }

    target_digits ? mapping(target_digits) : nil
  end

  private

  def leading_chars
    words.map { |word| word[0] }.uniq
  end

  def non_leading_chars
    words.flat_map { |word| word[1..-1].chars }.uniq
  end

  def words
    @input.split(/ \+ | == /)
  end

  def no_leading_zeroes?(digits)
    !digits[0...leading_chars.count].include?(0)
  end

  def solution?(digits)
    eval(substitute(digits))
  end

  def mapping(digits)
    @chars.zip(digits).to_h
  end

  def substitute(digits)
    output = @input.dup

    digits.each_index do |index|
      output.gsub!(@chars[index], digits[index].to_s)
    end

    output
  end
end
