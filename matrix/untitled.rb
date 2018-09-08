class Matrix
  attr_reader :rows, :columns

  def initialize(data)
    @row_size = data.split("\n")[0].split.size
    @rows = data.split("\n").map(&:split).flatten.map(&:to_i).each_slice(@row_size).to_a
    @columns = @rows.transpose
  end
end

