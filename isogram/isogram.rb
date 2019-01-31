module Isogram
  def self.isogram?(input)
    characters = input.gsub(/-|\s/, '').downcase.chars
    characters.size == characters.uniq.size
  end
end