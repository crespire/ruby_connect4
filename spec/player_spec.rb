# frozen_string_literal: true

# spec/player_spec.rb

require_relative '../lib/player'

describe Player do
  subject(:player) { described_class.new('Jim', 'X') }

  context 'on initialization' do
    it 'properly receives and stores a player name' do
      expect(player.name).to eq('Jim')
    end

    it 'properly receives and stores a player token' do
      expect(player.token).to eq('X')
    end
  end

  context 'once a player is set up' do
    it 'sends the correct value when receiving #name' do
      expect(player.name).to eq('Jim')
    end

    it 'sends the correct value when receiving #token' do
      expect(player.token).to eq('X')
    end
  end

  context 'it sends the proper input methods when commanded to' do
    it 'responds to #reply_yn' do
      allow(player).to receive(:reply_yn).and_return('y')
      answer = player.reply_yn
      expect(answer).to eq('y')
    end

    it 'responds to #game_input' do
      allow(player).to receive(:game_input).and_return(4)
      answer = player.game_input
      expect(answer).to eq(4)
    end
  end
end