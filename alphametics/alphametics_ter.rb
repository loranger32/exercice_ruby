require 'pry'

module Alphametics
  def self.solve(input)
    words = input.scan(/\w+/)
    uniq_chars = words.join.chars.uniq
    
    list = []
    (0..9).to_a.permutation(uniq_chars.size).each do |e|
      binding.pry
      next if words.any? { |word| word.tr(uniq_chars.join, e.join(''))[0] == '0' }
      if instance_eval(input.tr(uniq_chars.join, e.join('')))
        list = e
        break
      end
    end
    return {} if list.empty?
    Hash[Hash[uniq_chars.zip list].sort]
  end
end

module BookKeeping
  VERSION = 4
end
p Alphametics.solve("I + BB == ILL")
