require_relative "knight_king.rb"
require_relative "rook_bishop_queen.rb"
require_relative "pawn.rb"
require_relative "null_piece.rb"

class Board
    attr_reader :populate_board #maybe remove later
    attr_accessor :rows
    def initialize
        self.rows = Array.new(8) { Array.new(8) }
        self.populate_board
    end

    def [](pos)
        self.rows[pos.first][pos.last]
    end

    def []=(pos, value)
        self.rows[pos.first][pos.last] = value
    end

    def populate_board
        self.place_kings
        self.place_queens
        self.place_bishops
        self.place_knights
        self.place_rooks
        self.place_pawns
        self.place_null_pieces
    end

    def place_kings
        king_positions = [[0, 4], [7, 4]]
        king_positions.each { |position| self[position] = KnightKing.new(:K, self, position) }
    end

    def place_queens
        queen_positions = [[0, 3], [7, 3]]
        queen_positions.each { |position| self[position] = RookBishopQueen.new(:Q, self, position) }
    end

    def place_rooks
        rook_positions = [[0, 0], [0, 7], [7, 0], [7, 7]]
        rook_positions.each { |position| self[position] = RookBishopQueen.new(:R, self, position) }
    end

    def place_bishops
        bishops_positions = [[0, 2], [0, 5], [7, 2], [7, 5]]
        bishops_positions.each { |position| self[position] = RookBishopQueen.new(:B, self, position) }
    end

    def place_knights
        knights_positions = [[0, 1], [0, 6], [7, 1], [7, 6]]
        knights_positions.each { |position| self[position] = KnightKing.new(:N, self, position) }
    end

    def place_pawns
        self.rows[1].map! {|pos| Pawn.new(:P, self, pos)}
        self.rows[6].map! {|pos| Pawn.new(:P, self, pos)}
    end

    def place_null_pieces
        self.rows.each_with_index do |row, row_index|
            row.each_with_index do |col, col_index|
                if col.nil?
                    pos = [row_index, col_index]
                    self[pos] = NullPiece.new(nil, self, pos)
                end
            end
        end
    end

    def move_piece(start_pos, end_pos)
        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece.new(nil, self, start_pos)
        #should we create a new nullpiece instance each time/how are they stored in memory?
    end
end