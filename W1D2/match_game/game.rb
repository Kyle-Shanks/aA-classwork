require_relative "board_class"
require_relative "player_class"

class Game

  attr_accessor :guess_arr
  def initialize(player = HumanPlayer.new("Kyle"))
    @board = Board.new
    @guess_arr = []
    @player = player
  end

  def setup
    @board.populate
  end

  def make_guess
    @board.render
    guess = @player.get_input
    until valid_guess?(guess)
      puts "Invalid position."
      guess = @player.get_input
    end
    guess
  end

  def valid_guess?(pos)
    return false if @guess_arr.include?(pos)
    return false if pos[0] >= @board.size[1] || pos[1] >= @board.size[0]
    true
  end

  def add_to_guess_arr(arr)
    @guess_arr << arr
    @board.reveal(arr[0],arr[1])
  end

  def valid_match?(guess)
    @board[guess[0]] == @board[guess[1]]
  end

  def play
    setup
    until @board.won?
      guess = make_guess
      add_to_guess_arr(guess)
      if @guess_arr.length == 2
        if valid_match?(@guess_arr)
          # @player.receive_match
        else
          system("clear")
          @board.render
          sleep(2)
          @guess_arr.each { |pos| @board[pos].hide }
        end
        self.guess_arr = []
      end
    end

    conclude
  end

  def conclude
    @board.render
    puts "Congrats you win!"
  end

end
