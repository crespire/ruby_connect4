# frozen_string_literal: true

# lib/connect4.rb

require_relative 'board'
require_relative 'player'
require_relative 'display'

class Connect4
  def initialize(display: Display.new)
    @board = Board.new
    @players = []
    @display = display
    @moves = 0
    @tokens = ['○', '●']
  end

  def show_rules
    @display.rules
  end

  def show_board
    @display.board(@board)
  end

  def show_after
    @display.clear
    @display.board(@board)
    @display.after(@moves, @players)
  end

  def prompt_player_add
    return false if @tokens.empty?

    @display.player_add(@tokens.length)
    name = gets.chomp
    add_player(Player.new(name, @tokens.shift))
  end

  def add_player(player)
    @players << player
  end

  def prompt_game_input
    @display.game_input(@players[@moves % 2], @board)
    @players[@moves % 2].game_input
  end

  def play_round
    input = nil
    until @board.valid_move?(input)
      input = prompt_game_input
      @display.invalid_input unless @board.valid_move?(input)
    end
    @board.add_chip(input, @players[@moves % 2].token)
    increment_move unless @board.gameover?
  end

  def play
    play_round until @board.gameover?
  end

  def prompt_yn
    @display.ask_yn('Would you like to play again?')
    @players[@moves % 2].reply_yn
  end

  private

  def increment_move
    @moves += 1
  end
end
