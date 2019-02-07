module Isogram
  module_function

  def isogram?(input)
    letters = format_input(input)
    unique_letters?(letters)
  end

  def format_input(input)
    input.downcase.scan(/\w/)
  end

  def unique_letters?(letters)
    letters.size == letters.uniq.size
  end
end