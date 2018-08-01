require_relative 'card'

class Deck

  SUITS = [:heart, :diamond, :club, :spade]
  VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

  attr_reader :cards

  def initialize
    @cards = make_deck
  end

  def shuffle!
    self.cards.shuffle!
  end

  def take(n=1)
    cards.pop(n)
  end

  private

  def make_deck
    result = []
    SUITS.each do |suit|
      VALUES.each do |value|
        result << Card.new(value, suit)
      end
    end
    result
  end

end
