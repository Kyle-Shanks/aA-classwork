require_relative "player"

class HumanPlayer < Player
  def make_move(board)
    begin
      start_pos = nil
      end_pos = nil

      until start_pos
        display.render
        puts "\n#{color}'s turn."
        puts "\nSelect your piece"
        start_pos = display.cursor.get_input
      end

      until end_pos
        display.render
        puts "\n#{color}'s turn."
        puts "\nSelect where to place piece."
        end_pos = display.cursor.get_input
      end

      board.move_piece(start_pos, end_pos, color)
    rescue
      retry
    end
  end
end
