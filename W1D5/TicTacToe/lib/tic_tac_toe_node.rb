require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if board.over?
      other_mark = ((evaluator == :x) ? :o : :x)
      board.winner == other_mark
    else
      if next_mover_mark == evaluator
        children.all? {|node| node.losing_node?(evaluator)}
      else
        children.any? { |node| node.losing_node?(evaluator) }
      end
    end
  end

  def winning_node?(evaluator)
    if board.over?
      board.winner == evaluator
    else
      if next_mover_mark == evaluator
        children.any? { |node| node.winning_node?(evaluator) }
      else
        children.all? { |node| node.winning_node?(evaluator) }
      end
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_result = []

    empty_positions = []
    (0..2).each do |idx1|
      (0..2).each do |idx2|
        empty_positions << [idx1,idx2] if @board.empty?([idx1,idx2])
      end
    end

    empty_positions.each do |pos|
      dup_board = @board.dup
      dup_board[pos] = next_mover_mark

      next_move = (next_mover_mark == :x) ? :o : :x
      children_result << TicTacToeNode.new(dup_board,next_move,pos)
    end

    children_result
  end
end
