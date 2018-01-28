class Bst
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(value)
    if value > data
      right.nil? ? self.right = Bst.new(value) : right.insert(value)
    else
      left.nil? ? self.left = Bst.new(value) : left.insert(value)
    end
  end

  def each(&block)
    return self.to_enum unless block_given?
    left.each(&block) if left
    yield data
    right.each(&block) if right
  end
end
