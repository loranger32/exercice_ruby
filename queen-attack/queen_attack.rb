class Queens
  def initialize(positions)
    @white_position = validate_position(positions[:white])
    @black_position = validate_position(positions[:black])
    raise ArgumentError if @white_position == @black_position
  end

  def attack?
    raise StandardError, "Must have two queens to attack" if [@white_position, @black_position].any?(&:nil?)
    same_row? || same_column? || same_diagonal?
  end

  private
  
  def validate_position(position)
    return nil if position.nil?
    raise ArgumentError, "Position coordinates must be an Array" unless position.is_a?(Array)
    raise ArgumentError, "Position needs two coordinates" unless position.size == 2
    raise ArgumentError, "Position is out of board" unless position.all? { |index| index >= 0 && index < 8 }
    position
  end

  def same_row?
    @white_position[0] == @black_position[0]
  end

  def same_column?
    @white_position[1] == @black_position[1]
  end

  def same_diagonal?
    (@white_position[0] - @black_position[0]).abs == (@white_position[1] - @black_position[1]).abs
  end
end

module BookKeeping
  VERSION = 2
end
