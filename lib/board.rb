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

  def gameover?
    return true if check_col_win || check_row_win || check_diag_win || full?

    return false
  end

  def full?
    @board.flatten.length >= 42
  end

  def check_col_win
    @board.each do |column|
      column.each_cons(WIN) do |set|
        return true if set.uniq.count == 1
      end
    end

    false
  end

  def check_row_win
    nil_fill = Marshal.load(Marshal.dump(@board))
    nil_fill.each do |column|
      column << nil until column.length == HEIGHT
    end

    nil_fill.transpose.each do |row|
      row.each_cons(WIN) do |set|
        next if set.count(nil).positive?

        return true if set.uniq.count == 1
      end
    end

    false
  end

  def check_diag_win
    reverse = @board.reverse
    return true if diag_win(@board)
    return true if diag_win(reverse)

    false
  end

  def diag_win(board)
    # Checks for / wins from [0][0]

    bound = WIN - 1
    possible = board.take(bound)
    possible.each_with_index do |column, i|
      column.take(bound).each_with_index do |start, j|
        temp = [start]
        (1...WIN).to_a.each do |k|
          break if board[k + i][k + j].nil?

          temp.push(board[k + 1][k + j])
          return true if temp.length == WIN && temp.uniq.length == 1
        end
      end
    end

    false
  end
end
