class Brackets
  BRACKETS_SYMBOLS = ['(', '[', '{', ')', ']', '}']

  def initialize(text)
    @brackets_count = {'(' => 0, '[' => 0, '{' => 0, ')' => 0, ']' => 0, '}' => 0 }
    @brackets_list = extract_brackets(text)
  end

  def self.paired?(text)
    new(text).paired?
  end

  def paired?
    @brackets_list.each_with_index do |bracket, index|
      return false if wrong_nesting?(bracket, index)    
      @brackets_count[bracket] += 1
      return false if wrong_order?
    end
    correct_closing?
  end

  private

  def extract_brackets(text)
    text.each_char.with_object([]) do |char, brackets|
      brackets << char if BRACKETS_SYMBOLS.include?(char)
    end
  end

  def wrong_nesting?(bracket, index)
    @brackets_list[index-1] == '(' && (bracket == ']' || bracket == '}') ||
      @brackets_list[index-1] == '[' && (bracket == '}' || bracket == ')') ||
      @brackets_list[index-1] == '{' && (bracket == ']' || bracket == ')')
  end

  def wrong_order?
    @brackets_count[')'] > @brackets_count['('] ||
      @brackets_count[']'] > @brackets_count['['] ||
      @brackets_count['}'] > @brackets_count['{']
  end

  def correct_closing?
    @brackets_count[')'] == @brackets_count['('] &&
    @brackets_count[']'] == @brackets_count['['] &&
    @brackets_count['}'] == @brackets_count['{']
  end
end

module BookKeeping
  VERSION = 4
end
