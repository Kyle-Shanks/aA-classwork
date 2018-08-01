require_relative "piece"
require_relative "sliding_piece"

class Bishop < Piece
  include Slideable

  attr_reader :move_dirs

  def initialize(board, starting_pos, color)
    super(board, starting_pos, color)
    @move_dirs = [:d]
  end
end
