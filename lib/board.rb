# frozen_string_literal: true

# lib/board.rb

##
# This class is the main logic for all board functions.
class Board
  # Provides the last valid move made.
  attr_reader :last_move

  # +HEIGHT+ describes the allowed height of each column.
  HEIGHT = 6
  # +WIN+ describes the amount of tokens in a row to win.
  WIN = 4

  ##
  # Creates the data representation and last move.
  def initialize
    @board = Array.new(7) { [] }
    @last_move = nil
  end

  ##
  # Checks the input +col+ (an Integer) is within range and that the column isn't full.
  def valid_move?(col)
    return false if col.nil? || col.negative?
    return false if @board[col].nil?

    @board[col].length < HEIGHT
  end

  ##
  # Adds a token to the board.
  #
  # +col+ is the column
  #
  # +value+ is the value to add.
  def add_chip(col, value)
    return false unless valid_move?(col)

    @board[col] << value
    update_move(value)

    true
  end

  ##
  # Gameover? predicate returns true if there is a winner or the board is full.
  def gameover?
    return true if winner? || full?

    false
  end

  ##
  # Full? predicate returns true if the board is full.
  def full?
    @board.flatten.length >= 42
  end

  ##
  # Winner? predicate returns true if there is a winning combination.
  def winner?
    return true if check_col_win || check_row_win || check_diag_win

    false
  end

  ##
  # Helper method to get data representation of board.
  def get_data
    @board
  end

  ##
  # Helper method to return length of the game board.
  def length
    @board.length
  end

  private

  ##
  # Private helper to update the last move played.
  def update_move(value)
    @last_move = value
  end

  ##
  # Private helper to check for column wins.
  def check_col_win
    @board.each do |column|
      column.each_cons(WIN) do |set|
        next if set.length < 4 || set.include?(nil)

        return true if set.uniq.count == 1
      end
    end

    false
  end

  ##
  # Private helper to check for row wins.
  def check_row_win
    nil_fill = Marshal.load(Marshal.dump(@board))
    nil_fill.each { |column| column << nil until column.length >= HEIGHT }
    nil_fill.transpose.each do |row|
      row.each_cons(WIN) do |set|
        next if set.length < 4 || set.include?(nil)

        return true if set.uniq.count == 1
      end
    end

    false
  end

  ##
  # Private helper to check for diagonal wins.
  def check_diag_win
    reverse = @board.reverse
    return true if diag_win(@board) || diag_win(reverse)

    false
  end

  ##
  # Private helper that checks for diagonal win from [0][0] in / direction.
  def diag_win(board)
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
