class Phrase
  def initialize(sentence)
    @words = sentence.downcase.scan(/\b[\w']+\b/)
    @word_count = Hash.new(0)
  end

  def word_count
    @words.each_with_object(@word_count) do |word, counter|
      counter[word] += 1
    end
  end
end

class BookKeeping
  VERSION = 1
end
