require 'pry'

class Allergies
  
  attr_reader :list   

  ALLERGIES = { '128': 'cats',
          '64': 'pollen',
          '32': 'chocolate',
          '16': 'tomatoes',
          '8': 'strawberries',
          '4': 'shellfish',
          '2': 'peanuts',
          '1': 'eggs'
               }.freeze

  LIMIT = 256.freeze
  
  def initialize(score)
    @list = list_allergies(score).values
  end

  def allergic_to?(allergie)
    @list.include?(allergie)
  end 

  private

  def list_allergies(score)
    score -= LIMIT if score >= LIMIT
    ALLERGIES.select { |code|
      binding.pry
      delta = score - code.to_s.to_i 
      score = delta if delta >= 0
    }
  end

end

Allergies.new(509)
