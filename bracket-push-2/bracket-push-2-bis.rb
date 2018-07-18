class Brackets
  PAIRS = { '(' => ')', '{' => '}', '[' => ']' }

  def self.paired?(text)
    stack = []
    text.each_char do |char|
      if PAIRS.keys.include?(char)
        stack << char
      elsif PAIRS.values.include?(char)
        return false if stack.empty?
        return false if PAIRS[stack.pop] != char
      end
      true
    end
  end
end

module BookKeeping
  VERSION = 4
end
