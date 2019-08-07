class Piece
    attr_accessor :pos
    def initialize(symbol, board, pos) 
        @color = symbol
        @board = board
        @pos = pos
    end

    def to_s
        @color.to_s
    end

end