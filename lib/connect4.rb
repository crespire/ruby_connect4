# frozen_string_literal: true

# lib/connect4.rb

require_relative 'board'

class Connect4
  def initialize(display: Display.new)
    @board = Board.new
    @players = []
    @display = display
  end

  def show_rules
    @display.print_rules
  end

  def show_board
    @display.print_board
  end

  def show_after
    @display.print_after
  end
end
