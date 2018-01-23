class Raindrops
  FACTORS_TO_WORDS = {3 => "Pling", 5 => "Plang", 7 => "Plong"}

  def self.convert(int)
    factors = factors_of(int).select { |factor| [3, 5, 7].include?(factor) }
    return int.to_s if factors.empty?
    factors.map { |factor| FACTORS_TO_WORDS[factor] }.join
  end

  private

  def self.factors_of(int)
    first_half = Math.sqrt(int).to_i.downto(1).to_a.select do |num| 
      (int % num).zero?
    end
    second_half = first_half.map { |num| int / num }
    (first_half + second_half).uniq.sort  
  end
end

module BookKeeping
  VERSION = 3
end

p Raindrops.convert(9)
