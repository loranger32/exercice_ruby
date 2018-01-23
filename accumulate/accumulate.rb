class Array
  def accumulate
    result = []
    if block_given?
      each { |element| result << yield(element) }
      result
    else
      to_enum
    end
  end
end

class BookKeeping
  VERSION = 1
end
