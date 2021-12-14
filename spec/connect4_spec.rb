# frozen_string_literal: true

# spec/board_spec.rb

=begin
  Remember, TEST THE INTERFACE.
  Query messages return some value, don't change anything.
  Command messages return nothing, change something.

  Sometimes, a message can have elements of both query and command.

  Key is to remember this spec file tests Connect4. So we only test
  expectations for query messages. ie, Connect4 receives message and
  returns expected result.
=end

require_relative '../lib/connect4'
require_relative '../lib/board'

describe Connect4 do
  let(:display) { double('Display') }
  let(:player) { double('Player') }

  describe '#show_rules' do
    subject(:c4_rules) { described_class.new(display: display) }

    it 'should send Display the rules message' do
      allow(display).to receive(:rules)

      expect(display).to receive(:rules).once
      c4_rules.show_rules
    end
  end

  describe '#show_board' do
    subject(:c4_board) { described_class.new(display: display) }

    it 'should send Display the board message' do
      allow(display).to receive(:board)

      expect(display).to receive(:board).once
      c4_board.show_board
    end
  end

  describe '#show_after' do
    subject(:c4_after) { described_class.new(display: display) }

    it 'should send Display the after message' do
      allow(display).to receive(:after)

      expect(display).to receive(:after).once
      c4_after.show_after
    end
  end

  describe '#prompt_player_add' do
    subject(:c4_addplayer) { described_class.new(display: display) }

    it 'should send Display the player_add message' do
      allow(display).to receive(:player_add).and_return('Jim')

      expect(display).to receive(:player_add).once
      c4_addplayer.prompt_player_add
    end
  end

  describe '#add_player' do
    context 'when adding a named player' do
      subject(:c4_nameplayer) { described_class.new(display: display) }

      it 'should send the new player message and add the new object to the instance variable' do
        allow(player).to receive(:new)

        c4_nameplayer.add_player(player.new)
        players = c4_nameplayer.instance_variable_get(:@players)
        expect(players.length).to eq(1)
      end

      it 'should allow more than one player to be made' do
        allow(player).to receive(:new)

        c4_nameplayer.add_player(player.new)
        c4_nameplayer.add_player(player.new)
        players = c4_nameplayer.instance_variable_get(:@players)
        expect(players.length).to eq(2)
      end
    end
  end

  describe '#prompt_game_input' do
    subject(:c4_playprompt) { described_class.new(display: display) }

    context 'during a player turn' do
      before do
        allow(player).to receive(:new)
        allow(display).to receive(:game_input)
        allow(player).to receive(:game_input).and_return('4')
      end

      it 'should send a message to display to prompt user' do
        expect(display).to receive(:game_input)
        c4_playprompt.prompt_game_input(player)
      end

      it 'should send a message to player to take input' do
        expect(player).to receive(:game_input)
        c4_playprompt.prompt_game_input(player)
      end
    end
  end
end