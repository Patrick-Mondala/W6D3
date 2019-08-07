require_relative "board.rb"

class Display

    def initialize(board)
        @board = board
        # @cursor = cursor
    end

    def render
        @board.rows.each do |row|
            puts row.map { |ele| ele.nil? ? "    " : ele.to_s }.join(" | ")
            puts "------------------------------"
        end
        return true
    end

end