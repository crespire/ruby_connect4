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
end
