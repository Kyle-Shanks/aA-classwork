require_relative "piece"
require_relative "stepping_piece"

class Knight < Piece
  include Stepable

  def initialize(board, starting_pos, color)
    super(board, starting_pos, color)
    @move_diffs = [
      [-2, -1],
      [-2, 1],
      [-1, -2],
      [-1, 2],
      [1, -2],
      [1, 2],
      [2, -1],
      [2, 1]
    ]
  end

end
