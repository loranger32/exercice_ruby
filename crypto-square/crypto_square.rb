class Crypto
  attr_reader :normalized_text
  def initialize(raw_text)
    @raw_text = raw_text
    @normalized_text = normalize(@raw_text)
    @size = Math::sqrt(@normalized_text.size).ceil
  end

  def ciphertext
    return '' if @normalized_text.empty?
    segments.transpose.map(&:join).join(' ')
  end

  private

  def normalize(text)
    text.downcase.gsub(/\W+|_/, '')
  end

  def segments
    result = []
    @normalized_text.chars.each_slice(@size) { |slice| result << slice }
    @size.times do |index|
      result.last[index] = ' ' unless result.last[index]
    end
    result
  end
end

module BookKeeping
  VERSION = 1
end
