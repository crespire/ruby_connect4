# frozen_string_literal: true

class Board
  HEIGHT = 6
  WIN = 4

  def initialize
    @board = Array.new(7) { [] }
  end

  def valid_move?(col)
    return nil if @board[col].nil?

    @board[col].length < 6
  end

  def add_chip(col, value)
    return nil unless valid_move?(col)

    @board[col] << value
  end

  def game_over?
    return true if check_col_win || check_row_win
  end

  private

  def check_col_win
    @board.each do |column|
      column.each_cons(WIN) do |set|
        return true if set.uniq.count == 1
      end
    end

    false
  end

  def check_row_win
    @board.transpose.each do |row|
      row.each_cons(WIN) do |set|
        return true if set.uniq.count == 1
      end
    end

    false
  end

  def check_diag_win
  end

  def board_full?
    @board.flatten.length >= 42
  end
end
