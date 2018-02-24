class Scrabble

  POINTS = { "A" => 1, "E" => 1, "I" => 1, "L"  =>  1, "O" => 1, "U" => 1,
             "N" => 1, "R" => 1, "S" => 1, "T" => 1, "D" => 2, "G" => 2,
             "B" => 3, "C" => 3, "M" => 3, "P" => 3, "F" => 4, "H" => 4,
             "V" => 4, "W" => 4, "Y" => 4, "K" => 5, "J" => 8, "X" => 8,
             "Q" => 10, "Z" => 10 }

  def self.score(word)
    new(word).score
  end

  def initialize(word)
    @word = word ? word.to_s.upcase : ''
    @score = 0
  end

  def score
    return 0 if @word.match?(/\A\s*\z/)
    @word.each_char.map { |letter| POINTS[letter] }.sum
  end
end
