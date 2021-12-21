# frozen_string_literal: true

# lib/player.rb

class Player
  attr_reader :name, :token

  def initialize(name, token = nil)
    @name = name
    @token = token
  end

  def reply_yn
    gets.chomp
  end

  def game_input
    gets.chomp.to_i
  end
end
