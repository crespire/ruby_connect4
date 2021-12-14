# frozen_string_literal: true

# lib/board.rb

class Board
  attr_reader :last_move

  HEIGHT = 6
  WIN = 4

  def initialize
    @board = Array.new(7) { [] }
    @last_move = nil
  end

  def valid_move?(col)
    return false if @board[col].nil?

    @board[col].length < 6
  end

  def add_chip(col, value)
    return nil unless valid_move?(col)

    @board[col] << value
    update_move(value)
  end

  def gameover?
    return true if winner? || full?

    false
  end

  def full?
    @board.flatten.length >= 42
  end

  def winner?
    return true if check_col_win || check_row_win || check_diag_win

    false
  end

  private

  def update_move(value)
    @last_move = value
  end

  def check_col_win
    @board.each do |column|
      column.each_cons(WIN) do |set|
        next if set.length < 4 || set.include?(nil)

        return true if set.uniq.count == 1
      end
    end

    false
  end

  def check_row_win
    nil_fill = Marshal.load(Marshal.dump(@board))
    nil_fill.each { |column| column << nil until column.length == HEIGHT }
    nil_fill.transpose.each do |row|
      row.each_cons(WIN) do |set|
        next if set.length < 4 || set.include?(nil)

        return true if set.uniq.count == 1
      end
    end

    false
  end

  def check_diag_win
    reverse = @board.reverse
    return true if diag_win(@board) || diag_win(reverse)

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

          temp << board[k + i][k + j]
          return true if temp.length == WIN && temp.uniq.length == 1
        end
      end
    end
    false
  end
end
