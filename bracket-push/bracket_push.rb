require 'pry'

class Brackets

  def initialize
    @parenthesis = { '(' => 0, ')' => 0 }
    @square_brackets = { '[' => 0, ']' => 0 }
    @curly_braces = { '{' => 0, '}' => 0 }
    @left_brackets_count = [@parenthesis['('], @square_brackets['['], @curly_braces['{']].map(&:values)
    @right_brackets_count = [@parenthesis[')'], @square_brackets[']'], @curly_braces['}']].map(&:values)
  end

  def self.paired?(text)
    new.paired?(text)
  end

  def paired?(text)
    text.each_char do |char|
      @parenthesis[char] += 1 if @parenthesis[char]
      @square_brackets[char] += 1 if @square_brackets[char]
      @curly_braces[char]+= 1 if @curly_braces[char]
      return false if 
    end
    left_counter == right_counter
  end
end

module BookKeeping
  VERSION = 4
end


p Brackets.paired?('')
