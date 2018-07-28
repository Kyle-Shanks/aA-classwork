class HumanPlayer

  def initialize(name)
    @name = name
  end

  def get_input
    print "Make a guess: "
    guess = gets.chomp
    guess = guess.split(",").map(&:to_i)
  end

  def prompt
  end

  def receive_match(pos1,pos2)
  end

  def receive_reavled_card(pos,val)
  end

end




class ComputerPlayer

  def initialize
    @known_cards = Hash.new { |h,k| h[k] = [] }
    @matched_cards = []
  end



  def get_input

  end

  def receive_match(position1,position2)
    @matched_cards.push(position1)
    @matched_cards.push(position2)
  end


  def receive_revealed_card(position, value)
    @known_cards[value] << position
  end



end
