require_relative "pieces"
require_relative "chess_colors"
require 'colorize'

class Board
  include ChessColors

  BACK_ROW = [ Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook ]

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
  end

  def [](pos)
    return nil unless valid_pos?(pos)
    x,y = pos
    grid[x][y]
  end

  def []=(pos,val)
    return nil unless valid_pos?(pos)
    x,y = pos
    grid[x][y] = val
  end

  def populate_grid
    #Top = Red
    #Bottom = Blue

    grid.map!.with_index do |row, i|
      case i
      when 0, 7
        puts "Back Row"
        populate_back_row(i == 0 ? COLORS[0] : COLORS[1], i)
      when 1, 6
        puts "Pawn Row"
        populate_pawn_row(i == 1 ? COLORS[0] : COLORS[1], i)
      else
        [NullPiece.instance] * 8
      end
    end
  end

  def move_piece(start_pos, end_pos, color)
    piece = self[start_pos]

    raise "That's not your piece" unless piece.color == color
    raise "End position is not valid" unless valid_pos?(end_pos)
    raise "End position is not avialable for this piece" unless piece.moves.include?(end_pos)

    move_piece!(start_pos, end_pos)
  end

  def valid_pos?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

  def render(display, cursor_pos)
    puts "   #{(0...grid[0].length).to_a.join("  ")}"

    grid.each_with_index do |row, i|
      row_display = "#{i} "
      row.each_with_index do |ele, j|
        if [i, j] == cursor_pos
          str = display[ele.class].colorize(:color => ele.color, :background => :light_green)
          space = " ".colorize(:background => :light_green)
          row_display << (space + str + space)
        else
          str = display[ele.class].colorize(:color => ele.color)
          str = str.colorize(:background => :white) if ((i+j)%2 == 0)
          space = (i+j)%2 == 0 ? " ".colorize(:background => :white) : " "
          row_display << (space + str + space)
        end
      end
      puts row_display
    end
  end

  def in_check?(color)
    enemy_pieces = find_pieces(color == COLORS[0] ? COLORS[1] : COLORS[0])
    all_moves = enemy_pieces.reduce([]) {|array, piece| array += piece.moves}
    king = find_king(color)
    all_moves.include?(king.current_pos)
  end

  def checkmate?(color)
    our_pieces = find_pieces(color)

    our_pieces.all? do |piece|
      piece.moves.all? do |move|
        dup_board = self.dup
        dup_board.move_piece(piece.current_pos, move, color)
        dup_board.in_check?(color)
      end
    end
  end

  def dup
    new_board = Board.new

    all_pieces = find_pieces(COLORS[0]) + find_pieces(COLORS[1])

    all_pieces.each do |piece|
      starting_pos = piece.current_pos
      color = piece.color
      new_piece = piece.class.new(new_board, starting_pos, color)

      new_board[starting_pos] = new_piece
    end

    new_board
  end

  private

  attr_reader :grid

  def move_piece!(start_pos,end_pos)
    self[end_pos] = self[start_pos]
    self[end_pos].current_pos = end_pos
    self[start_pos] = NullPiece.instance
  end

  def populate_back_row(color, row_i)
    BACK_ROW.map.with_index do |klass, i|
      pos = [row_i, i]
      klass.new(self, pos, color)
    end
  end

  def populate_pawn_row(color, row_i)
    (0..7).map do |i|
      pos = [row_i, i]
      Pawn.new(self, pos, color)
    end
  end

  def find_pieces(color)
    results = []

    grid.each do |row|
      results += row.select {|piece| piece.color == color}
    end

    results
  end

  def find_king(color)
    find_pieces(color).select { |piece| piece.class == King }.first
  end

  def move_into_check?(start_pos, end_pos, color)
    dup_board = self.dup

    dup_board.move_piece(start_pos, end_pos, color)

    dup_board.in_check?(color)
  end

  def valid_moves(moves)
    moves.select { |move| valid_move?(move) }
  end

  def valid_move?(start_pos, end_pos, color)
    return false unless board[start_pos].color == color
    !move_into_check?(start_pos, end_pos, color)
  end
end
