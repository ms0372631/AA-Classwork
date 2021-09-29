

def my_uniq(arr)
    return arr.uniq
end


class Array
    def two_sum

        pairs = []
        self.each_with_index do |num1, i1|
            self.each_with_index do |num2, i2|
                if i1 < i2 && num1 + num2 == 0
                    pairs << [i1, i2]
                end
            end
        end

        pairs
    end
end

def my_transpose(arr)
    return arr.transpose
end

def stock_picker(arr)
    pairs = []
    cur_max_profit = 0
    arr.each_with_index do |buy, i|
        arr.each_with_index do |sell, j|
            if i < j && sell - buy > cur_max_profit
                pairs = [i, j]
                cur_max_profit = sell - buy
            end
        end
    end
    pairs
end


class Game
    attr_reader :board, :player
    def initialize
        @board = [[4, 3, 2, 1],[],[]]
        @player = "player"
    end

    def move(position, next_move)
        raise "can't make that move" if position > next_move.last

    end
end