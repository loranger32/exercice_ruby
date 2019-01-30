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
    output + compare_to_best
  end

  private

  def compare_to_best
    difference = personal_best - latest
    difference.zero? ? "That's your personal best!" : "That's #{difference} short of your personal best!"
  end
end