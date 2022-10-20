module ListOps
  module_function

  def arrays(ary)
    counter = 0
    ary.each { counter += 1 }
    counter
  end

  def reverser(ary)
    new_ary = []
    arrays(ary).times { new_ary.unshift(ary[_1]) }
    new_ary
  end

  def concatter(ary1, ary2)
    new_ary = []
    ary1.each { new_ary << _1 }
    ary2.each { new_ary << _1 }
    new_ary
  end

  def mapper(ary)
    return ary.clone unless block_given?

    new_ary = []
    ary.each { new_ary << yield(_1) }
    new_ary

  end

  def filterer(ary)
    return ary.clone unless block_given?

    new_ary = []
    ary.each { new_ary << _1 if yield(_1) }
    new_ary
  end

  def sum_reducer(ary)
    sum = 0
    ary.each { sum += _1 }
    sum
  end

  def factorial_reducer(ary)
    factorial = 1
    ary.each { factorial *= _1 }
    factorial
  end
end
