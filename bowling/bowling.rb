require 'pry'

class Game
  attr_reader :raw_throws, :formatted_frames

  class BowlingError < StandardError ; end

  def initialize
    @raw_throws = []
    @formatted_frames = []
  end
    
  def roll(pins)
    raise BowlingError unless (0..10) === pins
    raw_throws << pins
  end

  def score
    raise BowlingError if raw_throws.empty?
    format_frames
    
    result = 0
    formatted_frames[0..9].each_with_index do |frame_score, index|
      if is_strike?(frame_score)
        result += (10 + calculate_strike_bonus_at(index))
      elsif is_spare?(frame_score)
        result += (10 + formatted_frames[index + 1][0])
      else
        result += frame_score.sum
      end
    end
    result
    #formatted_frames.size > 10 ? result += formatted_frames.last.sum : result
  end

  def calculate_strike_bonus_at(index)
    if is_strike?(formatted_frames[index + 1])
      formatted_frames[index + 1].sum + formatted_frames[index + 2][0]
    else
      formatted_frames[index + 1].sum
    end
  end

  def format_frames
    raw_throws.each_with_index do |pins, index|
      if pins == 10
        raw_throws.insert(index + 1, 0)
      end
    end
    raw_throws.each_slice(2) { |frame| formatted_frames << frame }
  end

  def is_spare?(frame)
    frame.sum == 10 && !is_strike?(frame)
  end

  def is_strike?(frame)
    frame[0] == 10 && frame[1] == 0
  end

  def record(rolls)
    rolls.each { |pins| roll(pins) }
  end
end

game = Game.new
game.record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 7])
game.format_frames
p game
module BookKeeping
  VERSION = 3
end


