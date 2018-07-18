class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(targets)
    targets.select do |target|
      word.downcase.chars.sort == target.downcase.chars.sort &&
        !word.casecmp?(target)
    end
  end
end

module BookKeeping
  VERSION = 2
end
