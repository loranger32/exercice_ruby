class TwoBucket
  class Error < StandardError
    def initalize(msg = "Source cannot be empty while other is full !")
      super
    end
  end

  class Bucket
    attr_accessor :quantity, :size, :name

    def initialize(size, name)
      @size = size
      @name = name
      @quantity = 0
    end

    def full?
      @quantity == @size
    end

    def empty?
      @quantity == 0
    end

    def fill!
      @quantity = @size
    end

    def empty!
      @quantity = 0
    end

    def space_left
      @size - @quantity
    end

    def has_free_space?
      @size > @quantity
    end

    def pour_into(other)
      if other.space_left >= @quantity
        other.quantity += @quantity
        empty!
      else
        @quantity -= other.space_left
        other.fill!
      end
    end
  end

  def initialize(size_1, size_2, target, source)
    b1 = Bucket.new(size_1, "one")
    b2 = Bucket.new(size_2, "two")

    @source = source == "one" ? b1 : b2
    @other = source == "one" ? b2 : b1
    @source.fill!
    @target = target
    @counter = 1
    @has_computed_moves = false
  end

  def moves
    # No need to put in the loop since this is an edge case
    # that can be detected from the beginning
    fill_other! if other_is_same_size_as_target?
        
    while target_not_reached?
      check_rule!
      if other_is_full?
        empty_other!
      elsif can_pour_from_source?
        pour_source_into_other!
      elsif source_has_free_space?
        fill_source!
      else
        raise Error.new("No action available !")
      end
      @counter += 1
    end
    @has_computed_moves = true
    @counter
  end

  def goal_bucket
    raise Error.new("Must call the #moves method first") unless @has_computed_moves
    [@source, @other].find { _1.quantity == @target }.name
  end

  def other_bucket
    raise Error.new("Must call the #moves method first") unless @has_computed_moves
    [@source, @other].find { _1.quantity != @target }.quantity
  end

  private

  def can_pour_from_source?
    source_not_empty? && other_has_free_space? && rule_allows_pouring?
  end

  def check_rule!
    raise Error if @source.empty? && @other.full?
  end

  def debug!
    puts "Source".ljust(15) + "|" + "Other".rjust(10)
    puts "---------------------------------"
    puts "Size:".ljust(14) + @source.size.to_s + "|" + @other.size.to_s
    puts "Quantity".ljust(14) + @source.quantity.to_s + "|" + @other.quantity.to_s
    puts
  end

  def empty_other!
    @other.empty!
  end

  def fill_other!
    @other.fill!
    @counter += 1
  end

  def fill_source!
    @source.fill!
  end

  def other_is_full?
    @other.full?
  end
  
  def other_has_free_space?
    @other.space_left > 0
  end

  def pour_source_into_other!
    @source.pour_into(@other)
  end

  def rule_allows_pouring?
    @other.space_left != @source.quantity
  end

  def source_has_free_space?
    @source.space_left > 0
  end

  def source_not_empty?
    !@source.empty?
  end
  
  def target_not_reached?
    @source.quantity != @target && @other.quantity != @target
  end

  def other_is_same_size_as_target?
    @other.size == @target && @other.empty?
  end
end