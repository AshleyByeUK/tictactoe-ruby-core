module TicTacToe
  class InvalidPositionError < RuntimeError
    def initialize
      super("invalid position")
    end
  end
end
