require_relative "chess_colors"
require_relative "board"
require_relative "human_player"
require_relative "display"

class Game
  include ChessColors

  attr_accessor :current_player
  attr_reader :board, :display, :players

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {
      COLORS[0] => HumanPlayer.new(COLORS[0], @display),
      COLORS[1] => HumanPlayer.new(COLORS[1], @display)
    }
    @current_player = COLORS[0]
  end

  def setup
    board.populate_grid
  end

  def play
    setup

    until over?
      players[current_player].make_move(board)
      switch_players
    end

    puts "Thanks for playing!"
  end

  def over?
    board.checkmate?(current_player)
  end

  def switch_players
    self.current_player = (current_player == COLORS[0] ? COLORS[1] : COLORS[0])
  end
end
