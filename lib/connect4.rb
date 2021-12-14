# frozen_string_literal: true

# lib/connect4.rb

require_relative 'board'

class Connect4
  def initialize(display: Display.new)
    @board = Board.new
    @players = []
    @display = display
    @turns = 0
  end

  def show_rules
    @display.rules
  end

  def show_board
    @display.board
  end

  def show_after
    @display.after
  end

  def prompt_player_add
    @display.player_add
  end

  def add_player(player)
    @players << player
  end

  def prompt_game_input(player)
    @display.game_input
    player.game_input
  end
end
