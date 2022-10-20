class Poker
  def initialize(hands)
    @hands = hands
  end

  def best_hand
    return @hands if @hands.size == 1

  end
end

class Hand

  COMBINATIONS = %i[straight_flush four_of_a_kind full flush straight
    three_of_a_kind two_pair one_pair high_card]
  
  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  
  def initialize(cards)
    @cards = cards
  end

  def highest_card
    index = @cards.map(&:chars)
      .map(&:first)
      .map { VALUES.index(_1) }
      .max
    VALUES[index]   
  end

  def straight_flush?

  end

  def flush?

  end
end

class Card
  include Comparable

  SUITS = %w[S C D H]
  attr_reader :value, :suit

  def initialize(card)
    @value, @suit = card.chars
  end

  def <=> (other)
    if value != other.value
      value <=> other.value
    else
      SUITS.index(@suit) <=> SUITS.index(other.suit)
    end
  end
end

#Hand.new(%w[2S 8H 6S 8D JH]).highest_card

s8 = Card.new("8S")
c9 = Card.new("9C")
h8 = Card.new("8H")

p s8 > h8