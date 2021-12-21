# frozen_string_literal: true

# main.rb

require_relative 'lib/board'
require_relative 'lib/connect4'
require_relative 'lib/player'
require_relative 'lib/display'

quit = false
until quit
  game = Connect4.new
  game.show_rules
  game.prompt_player_add
  game.prompt_player_add
  game.play
  game.show_after
  ans = game.prompt_yn
  quit = ans == 'n'
end
