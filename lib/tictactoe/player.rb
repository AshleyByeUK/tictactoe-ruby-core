require 'tictactoe/easy_player'
require 'tictactoe/hard_player'
require 'tictactoe/human_player'

module TicTacToe
  class Player
    def self.create(type, token, name)
      case type
      when :human
        HumanPlayer.new(token, name)
      when :easy
        EasyPlayer.new(token, name)
      when :hard
        HardPlayer.new(token, name)
      else
        raise RuntimeError, "Unknown player type specified"
      end
    end
  end
end
