# frozen_string_literal: true

# spec/board_spec.rb

require_relative '../lib/connect4'
require_relative '../lib/board'
require_relative '../lib/display'

describe Connect4 do
  let(:display) { instance_double('Display') }
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
      allow(display).to receive(:player_add)

      expect(display).to receive(:player_add).once
      c4_addplayer.prompt_player_add
    end

    it "should return the new player's name" do
      allow(display).to receive(:player_add).and_return('Jim')

      expect(display).to receive(:player_add).once
      name = c4_addplayer.prompt_player_add
      expect(name).to eq('Jim')
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
    let(:player1) { double('Player', token: 'X') }
    let(:player2) { double('Player', token: 'O') }

    context 'during a player turn' do
      before do
        allow(player1).to receive(:game_input).and_return(6)
        allow(player2).to receive(:token).and_return('X')
        allow(player2).to receive(:game_input).and_return(3)
        allow(player2).to receive(:token).and_return('O')
        allow(display).to receive(:game_input)
        c4_playprompt.add_player(player1)
        c4_playprompt.add_player(player2)
      end

      it 'should send a message to display to prompt user' do
        expect(display).to receive(:game_input)
        c4_playprompt.prompt_game_input
      end

      it 'should send a message to player to take input and return the input' do
        expect(player1).to receive(:game_input).and_return(6)
        input = c4_playprompt.prompt_game_input
        expect(input).to eq(6)
      end

      it 'should prompt the correct player, starting with one' do
        expect(player1).to receive(:game_input).and_return(6)
        token = player1.token
        input = c4_playprompt.prompt_game_input
        expect(input).to eq(6)
        expect(token).to eq('X')

        c4_playprompt.instance_variable_set(:@moves, 1) # Manually increment moves

        expect(player2).to receive(:game_input).and_return(3)
        token = player2.token
        input = c4_playprompt.prompt_game_input
        expect(input).to eq(3)
        expect(token).to eq('O')
      end
    end
  end

  describe '#play_round' do
    subject(:c4_round) { described_class.new(display: display) }

    context 'when the game is set up' do
      before do
        allow(player).to receive(:game_input).and_return(6)
        allow(player).to receive(:token).and_return('X')
        allow(display).to receive(:game_input)
        c4_round.add_player(player)
        c4_round.add_player(player)
      end

      it 'should send a valid_move message on input' do
        error = 'Invalid move, please enter another.'
        expect(c4_round).to_not receive(:puts).with(error)
        c4_round.play_round
      end

      it 'should re-prompt a player when an invalid move is entered' do
        allow(player).to receive(:game_input).and_return('1', 4)
        allow(display).to receive(:invalid_input)
        expect(display).to receive(:invalid_input).once
        c4_round.play_round
      end

      it 'sends the add_chip message with valid input' do
        allow(player).to receive(:game_input).and_return(2)
        board = c4_round.instance_variable_get(:@board)
        expect(board).to receive(:add_chip).with(2, 'X')
        c4_round.play_round
      end

      it 'should increment @moves after a valid player move' do
        allow(player).to receive(:game_input).and_return(4)
        c4_round.play_round

        moves = c4_round.instance_variable_get(:@moves)
        expect(moves).to eq(1)
      end
    end
  end

  describe '#prompt_yn' do
    subject(:c4_ynprompt) { described_class.new(display: display) }
    before do
      allow(display).to receive(:ask_yn)
      allow(player).to receive(:reply_yn)
      c4_ynprompt.add_player(player)
    end

    it 'should send a message to display to prompt user' do
      expect(display).to receive(:ask_yn)
      c4_ynprompt.prompt_yn
    end

    it 'should send a message to player to take input and return the input' do
      expect(player).to receive(:reply_yn).and_return('y')
      input = c4_ynprompt.prompt_yn
      expect(input).to eq('y')
    end
  end

  describe '#play' do
    context 'when simulating a game with one move left' do
      subject(:c4_play) { described_class.new(display: display) }

      it 'should send play_round once and then send show_after' do
        board = c4_play.instance_variable_get(:@board)
        allow(board).to receive(:gameover?).and_return(false, true)

        expect(c4_play).to receive(:play_round).once
        expect(c4_play).to receive(:show_after).once
        c4_play.play
      end
    end
  end
end
