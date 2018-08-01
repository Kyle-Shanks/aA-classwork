module Slideable
  DIAGONAL_DIRS = [
    [-1, 1],
    [1, 1],
    [-1, -1],
    [1, -1]
  ]

  HORIZONTAL_DIRS = [
    [1, 0],
    [0, 1],
    [-1, 0],
    [0, -1]
  ]

  def moves
    result = []
    result += get_dirs(HORIZONTAL_DIRS) if @move_dirs.include?(:h)
    result += get_dirs(DIAGONAL_DIRS) if @move_dirs.include?(:d)
    result
  end

  def get_dirs(delta_arr)
    x, y = current_pos
    result = []
    delta_arr.each do |delta|
      temp_x, temp_y = delta[0]+x,delta[1]+y
      no_collision = @board[[temp_x,temp_y]].class == NullPiece
      while (temp_x.between?(0,7) && temp_y.between?(0,7)) && no_collision
        result << [temp_x,temp_y]
        temp_x += delta[0]
        temp_y += delta[1]
        no_collision = @board[[temp_x,temp_y]].class == NullPiece
      end

      if !@board[[temp_x,temp_y]].nil? && (@board[[temp_x,temp_y]].color != color) 
        result << [temp_x,temp_y]
      end
    end
    result
  end

end
