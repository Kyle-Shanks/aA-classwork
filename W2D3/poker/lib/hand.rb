class Hand

  # Need Rules for:
  # - Straight Flush (e.g. 56789 - suited)
  # - Four of a Kind (e.g. Q9999)
  # - Fullhouse (e.g. QQ999)
  # - Flush (e.g. Q9743 - suited)
  # - Straight (e.g. 56789)
  # - Three of a Kind (e.g. 84999)
  # - Two pair (e.g. Q7799)
  # - One pair (e.g. QQ7J9)

  WINNING_HANDS = [:one_pair, :two_pair, :three_of_a_kind, :straight, :flush,
    :fullhouse, :four_of_a_kind, :straight_flush]

  attr_reader :cards

  def initialize
    @cards = []
  end

  def <<(card)
    cards << card
  end



end
