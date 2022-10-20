require "pry"
class RotationalCipher

  LOWER_CASE_ALPHABET = ("a".."z").to_a.freeze
  UPPER_CASE_ALPHABET = ("A".."Z").to_a.freeze
  private_constant :LOWER_CASE_ALPHABET, :UPPER_CASE_ALPHABET

  def self.rotate(...)
    new(...).rotate
  end

  def initialize(input, cipher)
    @input = input.chars
    @cipher = cipher
  end

  def rotate
    @input.each_with_object([]) do |char, output|
      if LOWER_CASE_ALPHABET.include?(char)
        rotate_char(LOWER_CASE_ALPHABET, char, output)
      elsif UPPER_CASE_ALPHABET.include?(char)
        rotate_char(UPPER_CASE_ALPHABET, char, output)
      else
        output << char
      end
    end.join
  end

  private

  def rotate_char(char_list, char, output)
    output << char_list[(char_list.index(char) + @cipher) % 26]
  end
end
