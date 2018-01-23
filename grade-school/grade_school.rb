class School
  def initialize
    @roster = Hash.new { |hash, key| hash[key] = [] }
  end
    
  def students(grade)
    @roster[grade]
  end

  def add(name, grade)
    @roster[grade].push(name).sort!
  end

  def students_by_grade
    @roster.sort.map do |grade, students|
      { grade: grade, students: students.dup }
    end
  end
end

class BookKeeping
  VERSION = 3
end
