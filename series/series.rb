class Series
  attr_reader :serie
  
  def initialize(serie)
    @serie = serie
  end

  def slices(int)
    raise ArgumentError if int > serie.size
    serie.chars.each_cons(int).map(&:join)
  end
end
