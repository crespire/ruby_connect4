# frozen_string_literal: true

class Board
  HEIGHT = 6

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
end
