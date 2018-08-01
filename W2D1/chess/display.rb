require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  DISPLAY_HASH = {
    Piece => "X",
    NullPiece => " ",
    King => "K",
    Queen => "Q",
    Knight => "N",
    Bishop => "B",
    Rook => "R",
    Pawn => "P"
  }

  attr_accessor :board, :cursor

  def initialize(board = Board.new)
    @board = board
    @cursor = Cursor.new([0, 0], @board)
  end

  def render
    system("clear")
    board.render(DISPLAY_HASH, cursor.cursor_pos)
    nil
  end
end
