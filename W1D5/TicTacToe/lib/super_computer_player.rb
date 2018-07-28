require_relative 'tic_tac_toe_node'
require 'byebug'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    root_node = TicTacToeNode.new(game.board.dup,mark)
    children = root_node.children

    # Pick winner
    winning_node = children.find { |child| child.winning_node?(mark) }
    return winning_node.prev_move_pos if winning_node

    # pick not losing node
    children.find { |child| !(child.losing_node?(mark)) }.prev_move_pos
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
