class Garden
  PLANTS = {"G" => :grass, "C" => :clover, "R" => :radishes, "V" => :violets}.freeze
  CHILDRENS = %w[Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry].freeze

  def initialize(garden, childrens=CHILDRENS)
    @garden = import_garden(garden)
    @childrens = childrens.sort
  end

  private

  def first_row
    @garden[0]
  end

  def second_row
    @garden[1]
  end

  def method_missing(meth)
    child = meth.to_s.capitalize
    @childrens.include?(child) ? retrieve_plants_for(child) : super
  end

  def retrieve_plants_for(child)
    child_plants = []

    cups = child_cups(child)

    child_plants << first_row[cups]
    child_plants << second_row[cups]

    child_plants.flatten.map { PLANTS[_1] }
  end

  def child_cups(child)
    index = @childrens.index(child)
    index*2..index*2+1
  end

  def import_garden(garden)
    garden.lines.map(&:chomp).map(&:chars)
  end
end