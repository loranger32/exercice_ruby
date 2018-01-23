class School
  def initialize
    @roster = Hash.new { |hash, key| hash[key] = [] }
  end
    
  def students(grade)
    @roster[grade]
  end

  def add(name, grade)
    raise ArgumentError, "Grade must be between 1 and 7" unless (1..7) === grade
    @roster[grade] << name
    @roster[grade].sort!
  end

  def students_by_grade
    @roster.sort.map do |grade, students|
      { grade: grade, students: @roster[grade].dup }
    end
  end
end

class BookKeeping
  VERSION = 3
end
