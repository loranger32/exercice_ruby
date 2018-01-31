class Alphametics
  def self.solve(input)
    new(input).solve
  end

  def initialize(input)
    @original_input = input.dup
    @operands = @original_input.scan(/\w+/)
    @leading_solution_letter = @operands.last[0]
    @leading_letters = @operands.map { |operand| operand[0] }
    @letters = input.each_char.select { |char| char.match?(/\w/) }.uniq
    @combinations = create_optimized_combinations
  end

  def create_optimized_combinations
    optimized_combinations = (0..9).to_a.permutation(@letters.size).to_a.map do |comb|
      combination = @letters.zip(comb).to_h
      if combination.any? do |letter, value|
        (@leading_letters.include?(letter) && value == 0) || 
          (letter == @leading_solution_letter && value > @operands.size - 1)
         end
         nil
      else
        combination
      end
    end
    optimized_combinations.compact
  end

  def solve
    result = @combinations.find do |combination|
      input = @original_input.dup
      combination.each do |letter, value|
        input.gsub!(letter, value.to_s)
      end
      eval input
    end
    result.nil? ? {} : result.sort.to_h
  end
end

module BookKeeping
  VERSION = 4
end
