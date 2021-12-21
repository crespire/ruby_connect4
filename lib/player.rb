# frozen_string_literal: true

# lib/player.rb

##
# Class that primarily handles input and data for players.
class Player
  # Player name
  attr_reader :name
  # Player token
  attr_reader :token

  ##
  # Init with +name+ and +token+
  def initialize(name, token = nil)
    @name = name
    @token = token
  end

  ##
  # Method to get reponse.
  def reply_yn
    gets.chomp
  end

  ##
  # Method to get game input.
  def game_input
    gets.chomp.to_i
  end
end
