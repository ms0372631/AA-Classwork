class Board
    def initialize(n)
        @board = []
        (0...n).each do |i|
            col = []
            (0...n).each do |j|
                col << '_'
            end
            @board << col
        end
    end

    def board
        @board
    end

    def valid?(pos)
        return false if pos[0] < 0 || pos[0] > @board.length || pos[1] < 0 || pos[1] > @board[0].length
        true
    end

    def empty?(pos)
        return true if @board[pos[0]][pos[1]] == '_'
        false
    end

    def place_mark(pos, mark)
        if self.valid? && !self.empty
            @board[pos[0]][pos[1]] = mark
        else
            raise "this position of the grid is not valid to place a mark"
        end
    end

    def print
        @board.each do |b|
            p b
        end
    end

    def win_row?(mark)
        @gboard.each do |b|
            if b.all? {|a| a == mark}
                return true
            end
        end
        false
    end

    def win_col?(mark)
        f1 = false
        (0...@board[0].length).each do |j|
            f2 = true
            (0...@board.length).each do |i|
               f2 = false if @board[i][j] != mark
            end
            f1 = true if f2
        end
        f1
    end

    def win_diagonal?(mark)
        f1 = true
        i1 = 0
        j1 = 0
        while i1 < board.length && i2 < board[0].length
            f1 = false if @board[i1][j1] != mark
            i1 += 1
            j1 += 1
        end

        f2 = true
        i2 = 0
        j2 = @board[0].length - 1
        while i2 < board.length && i2 >= 0
            f2 = false if @board[i2][j2] != mark
            i2 += 1
            j2 -= 1
        end
        f1 || f2
    end

    def win?
        self.win_row? || self.win_col? || self.win_diagonal?
    end

    def empty_positions?
        (0...@board.length).each do |i|
            (0...@board[0].length).each do |j|
                return true if self.empty?([i, j])
            end
        end
        false
    end
end
