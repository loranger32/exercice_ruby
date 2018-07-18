class Brackets
  BRACKETS_SYMBOLS = ['(', '[', '{', ')', ']', '}']

  def initialize
    @brackets_count = {'(' => 0, '[' => 0, '{' => 0, ')' => 0, ']' => 0, '}' => 0 }
    @brackets_list = []
  end

  def self.paired?(text)
    new.paired?(text)
  end

  def paired?(text)
    text.each_char do |char|
      if BRACKETS_SYMBOLS.include?(char)
        return false if @brackets_list[-1] == '(' && (char == ']' || char == '}')
        return false if @brackets_list[-1] == '[' && (char == '}' || char == ')')
        return false if @brackets_list[-1] == '{' && (char == ']' || char == ')')
        
        @brackets_count[char] += 1
        @brackets_list << char
      end

      return false if @brackets_count[')'] > @brackets_count['(']
      return false if @brackets_count[']'] > @brackets_count['[']
      return false if @brackets_count['}'] > @brackets_count['{'] 
    end
  
    return false if @brackets_count[')'] != @brackets_count['(']
    return false if @brackets_count[']'] != @brackets_count['[']
    return false if @brackets_count['}'] != @brackets_count['{']
    true
  end
end

module BookKeeping
  VERSION = 4
end
