# frozen_string_literal: true

# spec/game_spec.rb

require_relative '../lib/game'

describe Game do
  describe '#initialize' do
    subject(:init_game) { described_class.new }
    let(:board) { init_game.instance_variable_get(:@board) }
    let(:height) { described_class::HEIGHT }

    it 'makes a board with 7 columns' do
      expect(board.length).to eq(7)
    end

    it 'height is set to 6' do
      expect(height).to eq(6)
    end
  end
end