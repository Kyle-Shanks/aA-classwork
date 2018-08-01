class Piece
  attr_accessor :current_pos, :color, :board

  def initialize(board, starting_pos, color)
    @board = board
    @current_pos = starting_pos
    @color = color
  end
end
