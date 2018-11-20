require 'tictactoe/mock_game_ui'
require 'tictactoe/game_engine'
require 'tictactoe/mock_player'

module TicTacToe
  describe GameEngine do
    before(:each) do
      @ui = MockGameUI.new
      @engine = GameEngine.new(@ui)
    end

    it "ends a game when the game is won" do
      p1 = MockPlayer.new('X', 1, 2, 3)
      p2 = MockPlayer.new('O', 4, 5)
      @engine.start(p1, p2)
      expect(@ui.show_game_state_called).to eq 6
      expect(@ui.get_move_called).to eq 5
      expect(@ui.show_game_result_called). to eq 1
    end

    it "ends a game when the game is tied" do
      p1 = MockPlayer.new('X', 5, 3, 4, 2, 9)
      p2 = MockPlayer.new('O', 1, 7, 6, 8)
      @engine.start(p1, p2)
      expect(@ui.show_game_state_called).to eq 10
      expect(@ui.get_move_called).to eq 9
      expect(@ui.show_game_result_called). to eq 1
    end

    it "runs a game on a custom sized board" do
      p1 = MockPlayer.new('X', 1, 2, 3, 4)
      p2 = MockPlayer.new('O', 5, 6, 7)
      @engine = GameEngine.new(@ui, 4)
      @engine.start(p1, p2)
      expect(@ui.show_game_state_called).to eq 8
      expect(@ui.get_move_called).to eq 7
      expect(@ui.show_game_result_called). to eq 1
    end

    it "does not change player until a valid move has been made" do
      p1 = MockPlayer.new('X', 1, 4, 2, 3)
      p2 = MockPlayer.new('O', 4, 5)
      @engine.start(p1, p2)
      expect(@ui.show_game_state_called).to eq 6
      expect(@ui.get_move_called).to eq 6
      expect(@ui.show_invalid_position_message_called).to eq 1
      expect(@ui.show_game_result_called). to eq 1
    end
  end
end
