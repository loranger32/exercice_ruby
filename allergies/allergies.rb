class Allergies
  attr_reader :list

  ALLERGY_MAPPING = { 1 => 'eggs', 2 => 'peanuts', 4 => 'shellfish',
                      8 => 'strawberries', 16 => 'tomatoes', 32 => 'chocolate',
                      64 => 'pollen', 128 => 'cats' }

  def initialize(score)
    @score = score -= 256 if score >= 256
    @list = generate_list
  end

  def allergic_to?(stuff)
    @list.include?(stuff)
  end

  private

  def generate_list
    ALLERGY_MAPPING.keys.reverse.each_with_object([]) do |stuff_score, list|
      next unless @score - stuff_score > 0

      list << ALLERGY_MAPPING[stuff_score]
      @score -= stuff_score
    end
  end
end
