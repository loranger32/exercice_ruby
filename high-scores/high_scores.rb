class HighScores
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def latest
    scores.last
  end

  def personal_best
    scores.max
  end

  def personal_top
    if scores.size >= 3
      scores.sort[-3..-1].reverse
    else
      scores.sort.reverse
    end
  end

  def report
    if latest == personal_best
      "Your latest score was #{personal_best}. That's your personal best!"
    else
      difference = personal_best - latest
      "Your latest score was #{latest}. That's #{difference} short of your personal best!"
    end
  end
end