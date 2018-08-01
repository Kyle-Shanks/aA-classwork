require_relative "piece"
require_relative "stepping_piece"

class King < Piece
  include Stepable

  def initialize(board, starting_pos, color)
    super(board, starting_pos, color)
    @move_diffs = [
      [-1, -1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0, 1],
      [1, -1],
      [1, 0],
      [1, 1]
    ]
  end

end
