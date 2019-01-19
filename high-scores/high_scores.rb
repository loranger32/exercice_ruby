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
    scores.max(3)
  end

  def report
    output = "Your latest score was #{latest}. "
    if latest == personal_best
      output + "That's your personal best!"
    else
      difference = personal_best - latest
      output + "That's #{difference} short of your personal best!"
    end
  end
end