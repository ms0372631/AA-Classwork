class Board
    attr_reader :size

    def initialize(num)
        @grid = Array.new(num) {Array.new(num, :N)}
        @size = num * num
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(pos, v)
        @grid[pos[0]][pos[1]] = v
    end

    def num_ships
        sum = 0
        @grid.each do |g|
            sum += g.count {|a| a == :S}
        end
        sum 
    end

    def attack(pos)
        if self.[](pos) == :S
            self.[]=(pos, :H)
            puts "you sunk my battleship!"
            return true
        else
            self.[]=(pos, :X)
            return false
        end
    end

    def place_random_ships
        total = @size * 0.25
        while self.num_ships < total
            new_pos = [rand(0...@grid.length), rand(0...@grid.length)]
            self.[]=(new_pos, :S)
        end
    end

    def hidden_ships_grid
        @grid.map do |g|
            g.map do |a|
                if a == :S
                    a = :N
                else
                    a
                end
            end
        end
    end

    def self.print_grid(arr)
        arr.each do |a|
            puts "#{a.join(" ")}"
        end
    end
    
    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
