class Alphametics
  def self.solve(input)
    original_input = input.dup
    letters = retrieve_letters_from(input)
    combinations = create_combinations_based_on(letters)
    good_values_out_of(combinations, original_input)
  end
  
  def self.retrieve_letters_from(input)
    input.each_char.select { |char| char.match?(/\w/) }.uniq
  end

  def self.create_combinations_based_on(letters)
    basic_combinations = (0..9).to_a.permutation(letters.size).to_a
    basic_combinations.map! { |combination| letters.zip(combination) }
  end

  def self.good_values_out_of(combinations, original_input)
    result = combinations.find do |combination|
      input = original_input.dup
      combination.each do |letter, value|
        input.gsub!(letter, value.to_s)
      end
      numbers = input.scan(/\d+/).flatten
      next if numbers.any? { |num| num.start_with?('0') }

      numbers.map!(&:to_i)
      numbers[0..-2].sum == numbers.last
    end
    result.nil? ? {} : result.sort.to_h
  end
end

module BookKeeping
  VERSION = 4
end

# p Alphametics.solve("I + BB == ILL")
# p Alphametics.solve("AS + A == MOM")
# p Alphametics.solve("A == B")
# p Alphametics.solve("ACA + DD == BD")
# p Alphametics.solve("NO + NO + TOO == LATE")
