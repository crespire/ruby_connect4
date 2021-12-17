# frozen_string_literal: true

# lib/display.rb

class Display
  def print_board(board)
    row_index = Board::HEIGHT - 1
    board_data = board.get_data
    until row_index.negative?
      col_index = 0
      until col_index > 6
        cell = board_data[col_index][row_index]
        print cell.nil? ? '  ' : "#{cell} "
        col_index += 1
      end
      print "\n"
      row_index -= 1
    end
  end
end