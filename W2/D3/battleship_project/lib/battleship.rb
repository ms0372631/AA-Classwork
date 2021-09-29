require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new()
        @board = Board.new(n)
        @remaining_misses = n * n / 2
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        end
        false
    end

    def win?
        if @board.num_ships == 0
            puts "you win"
            return true
        end
        false
    end

    def game_over?
        self.win? || self.lose?
    end

    def turn 
        @remaining_misses -= 1 if !@board.attack(@player.get_move)
        @board.print
        puts "#{@remaining_misses}"
    end

end
