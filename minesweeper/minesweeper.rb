class Board
  class Square
    def initialize(mark)
      @mark = mark
    end

    def adjacents(index, line_up, current_line, line_down)

    end

    def to_s
      @mark
    end
  end

  def self.transform(input)
    new(input).transform
  end

  def initialize(input)
    validate_input(input)
    @border = input[0]
    @board = input[1..-2].map do |line|
      line[1..-2].chars.map { Square.new(_1) }
    end
  end

  def transform
    @board
  end

  private

  def validate_input(input)
    raise ArgumentError if invalid_length?(input) || faulty_border?(input) || invalid_char?(input)
  end

  def invalid_length?(input)
    length = input[0].length
    input.any? { _1.length != length }
  end

  def faulty_border?(input)
    ![input.first, input.last].all? { _1.match?(/\A\+-+\+\z/) }
  end

  def invalid_char?(input)
    !input[1..-2].all? { _1.match?(/\A[ |*]+\z/) }
  end
end

 inp = ['+------+', '| *  * |', '|  *   |', '|    * |', '|   * *|',
           '| *  * |', '|      |', '+------+']

Board.transform(inp)
