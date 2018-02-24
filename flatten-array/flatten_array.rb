module FlattenArray
  module_function

  def flatten(arr)
    arr.reduce([]) do |acc, el|
      el.respond_to?(:flatten) ? acc += flatten(el) : acc << el
    end.reject(&:nil?)
  end
end

module BookKeeping
  VERSION = 1
end
