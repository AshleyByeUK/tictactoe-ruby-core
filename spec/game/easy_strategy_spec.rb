require 'rspec'
require 'game/easy_strategy'
require 'game/board'

module Game
  ONE = Board::PLAYER_ONE
  TWO = Board::PLAYER_TWO

  describe EasyStrategy do
    it "picks a random position from available positions" do
      board = Board.new([ONE, TWO, ONE].concat([*3..8]))
      easy = EasyStrategy.new()
      move = easy.compute_move(board)
      expect(board.available_positions).to include(move)
    end
  end
end