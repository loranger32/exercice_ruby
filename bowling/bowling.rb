class Game
  attr_accessor :frames

  class BowlingError < StandardError ; end

  def initialize
    @frames = [[]]
  end
    
  def roll(pins)
    raise BowlingError if frames.size == 10 && frames.last.size == 2 && 
      !is_strike?(frames.last) && !is_spare?(frames.last)
    raise BowlingError unless (0..10) === pins
    if pins == 10
      if frames.last.empty? 
        frames.last << 10
        frames.last << 0
      elsif frames.last.size == 2
        frames << [10, 0]
      else
        raise BowlingError
      end
    else
      if frames.last.size < 2
        raise BowlingError if (pins + frames.last.sum > 10)
        frames.last << pins
      else
        frames << [pins]
      end
    end
  end

  def score
    raise BowlingError if frames.size < 10
    raise BowlingError if frames.size == 10 && (is_strike?(frames.last) ||
      is_spare?(frames.last))
    raise BowlingError if frames.size == 11 && is_strike?(frames[-2]) &&
      is_strike?(frames.last)

    result = 0
    frames[0..9].each_with_index do |frame, index|
      if is_strike?(frame)
        result += (10 + calculate_strike_bonus_at(index))
      elsif is_spare?(frame)
        result += (10 + frames[index + 1][0])
      else
        result += frame.sum
      end
    end
    result
  end

  def calculate_strike_bonus_at(index)
    if is_strike?(frames[index + 1])
      frames[index + 1].sum + frames[index + 2][0]
    else
      frames[index + 1].sum
    end
  end

  def is_spare?(frame)
    frame.sum == 10 && !is_strike?(frame)
  end

  def is_strike?(frame)
    frame[0] == 10 && frame[1] == 0
  end
end

module BookKeeping
  VERSION = 3
end


