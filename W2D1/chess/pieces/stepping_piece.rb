module Stepable
  def moves
    x,y = @current_pos
    possible = @move_diffs.map do |move|
      dx,dy = move
      [x+dx,y+dy]
    end
    #Out of bounds or our piece
    possible.reject do |pos|
      pos.any? {|num| num < 0 || num > 7} || @board[pos].color == @color
    end
  end
end
