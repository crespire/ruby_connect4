# frozen_string_literal: true

# lib/connect4.rb

require_relative 'board'

class Connect4
  def initialize(display: Display.new)
    @board = Board.new
    @players = []
    @display = display
    @moves = 0
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

  def prompt_game_input
    @display.game_input
    @players[@moves % 2].game_input
  end

  def play_round
    input = nil
    until @board.valid_move?(input)
      input = prompt_game_input
      puts 'Invalid move, please enter another.' unless @board.valid_move?(input)
    end
    @board.add_chip(input, @players[@moves % 2].token)
    increment_move
  end

  def play
    play_round until @board.gameover?
    show_after
  end

  def prompt_yn
    @display.ask_yn
    @players[@moves % 2].reply_yn
  end

  private

  def increment_move
    @moves += 1
  end
end
