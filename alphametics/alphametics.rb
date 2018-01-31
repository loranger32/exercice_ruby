class Alphametics
  def self.solve(input)
    letters = input.each_char.select { |char| char.match?(/\w/) }.uniq
    (0..9).to_a.permutation(letters.size) do |combination|
      essay = input.tr(letters.join, combination.join)
      if !essay[/\b0/] && eval(essay)
        return letters.zip(combination).to_h
      end
    end
    {}
  end
end

module BookKeeping
  VERSION = 4
end
