class Array
  def keep
    each_with_object([]) { |el, result| result << el if yield(el) }
  end

  def discard
    each_with_object([]) { |el, result| result << el unless yield(el) }
  end
end
