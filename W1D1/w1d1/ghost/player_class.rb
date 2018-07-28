# Player classes
class Player
  attr_reader :name, :strikes

  def initialize(name="Player")
    @name = name
    @strikes = 0
  end

  def guess(fragment)
    puts "The current fragment is #{fragment}" if fragment.length > 0
    print "Give the next letter: "
    guess = gets.strip.downcase
  end

  def alert_invalid_guess
    puts "Invalid guess. Try again."
  end

  def receive_strike
    @strikes += 1
  end
end

class AiPlayer < Player
  def initialize
    super
    @dictionary = File.readlines("dictionary.txt").map(&:strip)
  end

  def guess(fragment)
    # Work in progress
  end
end
