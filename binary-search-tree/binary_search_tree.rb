module BookKeeping
  VERSION = 1
end

class Node
  attr_accessor :data, :left, :right

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end  
end

class Bst
  attr_accessor :current_node

  def initialize(root)
    @root = Node.new(root)
    @nodes = [@root]
    @current_node = @nodes.first
    @values = []
  end

  def data
    @root.data
  end

  def left
    current_node.left
  end

  def right
    current_node.right
  end

  def each
    @nodes.each { |node| @values << node.data }
    @values.sort!
    if block_given?
      @values.each { |value| yield(value) }
    else
      @values.to_enum
    end
  end

  def insert(new_data)
    if new_data > current_node.data
      insert_right(new_data)
    else
      insert_left(new_data)
    end
    reinitialize_current_node
  end

  def insert_right(new_data)
    if current_node.right.nil?
      new_node = Node.new(new_data)
      current_node.right = new_node
      @nodes << new_node
    else
      self.current_node = right
      insert(new_data)
    end
  end

  def insert_left(new_data)
    if current_node.left.nil?
      new_node = Node.new(new_data)
      current_node.left = new_node
      @nodes << new_node
    else
      self.current_node = left
      insert(new_data)
    end
  end

  def reinitialize_current_node
    self.current_node = @nodes.first
  end
end

# four = Bst.new 4
# four.insert 2
# four.insert 1
# four.insert 3
# four.insert 6
# four.insert 7
# four.insert 5

# plop = []
# four.each { |data| plop << data }
# p plop
