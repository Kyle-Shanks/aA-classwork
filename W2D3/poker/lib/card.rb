SYMBOLS = {
  heart: "♡",
  club: "♧",
  spade: "♤",
  diamond: "♢"
}

class Card

  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def ==(card)
    value == card.value
  end

  def to_s
    "#{value}#{SYMBOLS[suit]}"
  end

end
