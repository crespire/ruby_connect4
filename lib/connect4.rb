# frozen_string_literal: true

# lib/connect4.rb

require_relative 'board'

class Connect4
  def initialize(board: Board.new)
    @board = board
    @players = []
    @display = Display.new
  end
end
