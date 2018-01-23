module ETL
  def self.transform(old)
    old.each_with_object({}) do |(score, letters), result|
      letters.each { |letter| result[letter.downcase] = score }
    end
  end
end

module BookKeeping
  VERSION = 1
end
