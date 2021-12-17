# frozen_string_literal: true

# lib/display.rb

class Display
  def board(board)
    row_index = Board::HEIGHT - 1
    board_data = board.get_data
    until row_index.negative?
      col_index = 0
      until col_index > (board_data.length - 1)
        cell = board_data[col_index][row_index]
        print cell.nil? ? '  ' : "#{cell} "
        col_index += 1
      end
      print "\n"
      row_index -= 1
    end
  end

  def rules
  end

  def after
  end

  def add_player
  end

  def game_input
  end

  def ask_yn
  end
end