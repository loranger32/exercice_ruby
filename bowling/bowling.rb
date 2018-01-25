# Class to handle operations on frames
class Frame
  attr_accessor :rolls

  def self.strike
    new(10, 0)
  end

  def initialize(first_roll = nil, second_roll = nil)
    @rolls = [first_roll, second_roll]
  end

  def spare?
    rolls.sum == 10 && !strike?
  end

  def strike?
    rolls[0] == 10 && rolls[1].zero?
  end

  def mark_as_strike
    self.rolls = [10, 0]
  end

  def complete?
    rolls.size == 2 && rolls.none?(&:nil?)
  end

  def add_first_roll_with(pins)
    rolls[0] = pins
  end

  def add_second_roll_with(pins)
    rolls[1] = pins
  end

  def empty?
    rolls == [nil, nil]
  end

  def one_roll_to_go?
    !rolls[0].nil? && rolls[1].nil?
  end

  def first_roll
    rolls[0]
  end

  def total
    rolls.compact.sum
  end
end

# Main class
class Game
  attr_accessor :frames

  class BowlingError < StandardError; end

  def initialize
    @frames = [Frame.new]
    @final_score = 0
  end

  def roll(pins)
    ensure_can_roll
    ensure_roll_is_valid_with(pins)
    assign_pins_to_frame(pins)
  end

  def score
    ensure_game_is_finished
    calculate_score
    @final_score
  end

  private

  def last_frame
    frames.last
  end

  def ensure_can_roll
    if frames.size == 10 && last_frame.complete? && !last_frame.strike? &&
       !last_frame.spare?
      raise BowlingError, 'game is complete'
    end
  end

  def ensure_roll_is_valid_with(pins)
    unless (0..10).cover?(pins)
      raise BowlingError, "Pins is #{pins}, but must be between 0 and 10"
    end
  end

  def assign_pins_to_frame(pins)
    if pins == 10
      handle_strike
    elsif last_frame.one_roll_to_go?
      handle_second_roll(pins)
    elsif last_frame.empty?
      handle_first_roll(pins)
    else
      frames << Frame.new(pins)
    end
  end

  def handle_strike
    if last_frame.empty?
      last_frame.mark_as_strike
    elsif last_frame.complete?
      frames << Frame.strike
    else
      raise BowlingError, 'Strike cannot be achieved on second roll'
    end
  end

  def handle_second_roll(pins)
    estimated_total = pins + last_frame.total
    raise BowlingError, 'Frame is more than 10' if estimated_total > 10
    last_frame.add_second_roll_with(pins)
  end

  def handle_first_roll(pins)
    last_frame.add_first_roll_with(pins)
  end

  def ensure_game_is_finished
    raise BowlingError, 'Frames left to play' if frames.size < 10
    ensure_no_bonus_roll_to_play_when_10_frames_played
    ensure_no_bonus_roll_to_play_when_11_frames_played
  end

  def ensure_no_bonus_roll_to_play_when_10_frames_played
    if frames.size == 10 && (last_frame.strike? || last_frame.spare?)
      raise BowlingError, 'Bonus roll left to play'
    end
  end

  def ensure_no_bonus_roll_to_play_when_11_frames_played
    if frames.size == 11 && frames[-2].strike? && last_frame.strike?
      raise BowlingError, 'Bonus roll left to play'
    end
  end

  def calculate_score
    frames[0..9].each_with_index do |frame, index|
      @final_score = if frame.strike?
                       compute_strike_points_at(index)
                     elsif frame.spare?
                       compute_spare_points_at(index)
                     else
                       @final_score + frame.total
                     end
    end
  end

  def compute_strike_points_at(index)
    @final_score + 10 + calculate_strike_bonus_at(index)
  end

  def calculate_strike_bonus_at(index)
    next_frame = frames[index + 1]
    if next_frame.strike?
      next_frame.total + frames[index + 2].first_roll
    else
      next_frame.total
    end
  end

  def compute_spare_points_at(index)
    @final_score + 10 + frames[index + 1].first_roll
  end
end

module BookKeeping
  VERSION = 3
end
