class Triangle
  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    @sides.uniq.size == 1 && legal_triangle?
  end

  def isosceles?
    @sides.uniq.size <= 2 && legal_triangle?
  end

  def scalene?
    !equilateral? && !isosceles? && legal_triangle?
  end

  private

  def legal_triangle?
    all_sides_are_greater_than_zero? && legal_dimensions?
  end

  def all_sides_are_greater_than_zero?
    @sides.all? { |side| side > 0 }
  end

  def legal_dimensions?
    3.times do
      return false if @sides[0] + @sides[1] < @sides[2]
      @sides.rotate!
    end
  end
end