module Acronym
  def self.abbreviate(expression)
    expression.split(/ |-/).map(&:chr).join.upcase
  end
end

module BookKeeping
  VERSION = 4
end
