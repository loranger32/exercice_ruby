class Matrix
  attr_reader :rows, :columns

  def initialize(data)
    @row_size = data.split("\n")[0].split.size
    @rows = data.split("\n").map(&:split).flatten.map(&:to_i).each_slice(@row_size).to_a
    @columns = @rows.transpose
  end

  def saddle_points
    (highests_in_rows & lowests_in_columns).map { |infos| [infos[:row_number], infos[:col_number]] }
  end

  def highests_in_rows
    result = []
    rows.each_with_index do |row, row_index|
      highest = row.max
      row.each_with_index do |number, column_index|
        if number == highest
          result << { row_number: row_index,
                      col_number: column_index,
                      number: number }
        end
      end
    end
    result
  end

  def lowests_in_columns
    result = []
    columns.each_with_index do |column, column_index|
      lowest = column.min
      column.each_with_index do |number, row_index|
        if number == lowest
          result << { col_number: column_index,
                      row_number: row_index,
                      number: number }
        end
      end
    end
    result
  end
end
