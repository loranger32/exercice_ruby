class Alphametics
  def self.solve(input)
    original_input = input.dup
    letters = retrieve_letters_from(input)
    full_combinations = create_combinations_based_on(letters)
    good_values_out_of(full_combinations, original_input)
  end
  
  def self.retrieve_letters_from(input)
    input.each_char.select { |char| char.match?(/\w/) }.uniq
  end

  def self.create_combinations_based_on(letters)
    basic_combinations = create_basic_combinations_with(letters)
    create_full_combinations_with(basic_combinations, letters)
  end

  def self.create_basic_combinations_with(letters)
    combinations = []
    (10**letters.size).times do |n|
      result = n.digits
      while result.size < letters.size
        result.unshift(0)
      end
      combinations << result unless result.uniq.size < letters.size
    end
    combinations
  end

  def self.create_full_combinations_with(basic_combinations, letters)
    full_combinations = []
    (letters.size - 1).times do
      full_combinations << basic_combinations.map do |combination| 
        letters.zip(combination).to_h 
      end
      letters.rotate!
    end
    full_combinations.flatten!
  end

  def self.good_values_out_of(full_combinations, original_input)
    result = full_combinations.find do |combination|
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

p Alphametics.solve("I + BB == ILL")
