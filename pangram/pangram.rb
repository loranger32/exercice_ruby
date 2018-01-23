class Pangram
  def self.pangram?(phrase)
    ('a'..'z').all? { |character| phrase.downcase.include?(character) }
  end
end

class BookKeeping
  VERSION = 5
end
