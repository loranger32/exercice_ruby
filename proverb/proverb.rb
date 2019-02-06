class Proverb
  def initialize(*nouns, qualifier: nil)
    @nouns = nouns
    @qualifier = qualifier
  end

  def to_s
    generate_proverb
  end

  private

  def generate_proverb
    proverb = ''
    (@nouns.size - 1).times do |index|
      proverb << "For want of a #{@nouns[index]} the #{@nouns[index + 1]} was lost.\n"
    end
    ending_word = @qualifier ? "#{@qualifier} #{@nouns[0]}" : @nouns[0]
    proverb << "And all for the want of a #{ending_word}."
  end
end
