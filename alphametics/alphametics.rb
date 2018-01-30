class Alphametics
  def self.solve(input)
    new(input).solve
  end

  def initialize(input)
    @original_input = input.dup
    @operands = @original_input.scan(/\w+/)
    @letters = input.each_char.select { |char| char.match?(/\w/) }.uniq
    @combinations = (0..9).to_a.permutation(@letters.size).to_a.map do |comb|
      @letters.zip(comb)
    end
    @leading_solution_letter = @operands.last[0]
    @leading_letters = @operands.map { |operand| operand[0] }
  end

  def solve
    result = @combinations.find do |combination|
      input = @original_input.dup
      combination.each do |letter, value|
        next if (@leading_letters.include?(letter) && value == 0) || 
          (letter == @leading_solution_letter && value > @operands.size - 1)
        input.gsub!(letter, value.to_s)
      end
      eval input if input.scan(/[A-Z]/).empty?
    end
    result.nil? ? {} : result.sort.to_h
  end
end

module BookKeeping
  VERSION = 4
end
