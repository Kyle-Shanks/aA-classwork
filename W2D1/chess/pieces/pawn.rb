require_relative "piece"
require_relative "../chess_colors"

class Pawn < Piece
  include ChessColors
  FOR_HASH = {
    COLORS[0] => [1, 0],
    COLORS[1] => [-1, 0]
  }

  SIDE_HASH = {
    COLORS[0] => [[1, 1], [1, -1]],
    COLORS[1] => [[-1, 1], [-1, -1]]
  }

  def moves
    x,y = @current_pos
    start_row = (@color == COLORS[0] ? 1 : 6)
    f_delta = FOR_HASH[@color]

    available = [ [f_delta[0]+x, f_delta[1]+y] ]
    available << [(f_delta[0]*2)+x, f_delta[1]+y] if x == start_row

    available.reject! { |pos| @board[pos].class != NullPiece }

    SIDE_HASH[@color].each do |pos|
      new_pos = [pos[0]+x, pos[1]+y]
      target = @board[new_pos]
      if target
        available << new_pos if target.color != @color && target.class != NullPiece
      end
    end

    available
  end

end
