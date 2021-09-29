require './board.rb'
require './human_player.rb'
require './computer_player.rb'

class Game
    def initialize(n, players)
        @players = players.map do |mark, is_computer|
            is_computer ? ComputerPlayer.new(mark) : HumanPlayer.new(mark)
        end
        @current_player = @players.first
        @board = Board.new(n)
    end

    def switch_turn
        @current_player = @players.rotate!.first
    end

    def play
        while @board.empty_positions?
            @board.print
            choices = @board.legal_positions
            pos = @current_player.get_position(choices)
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts 'Game Over'
                puts @current_player.mark.to_s + ' HAS WON!'
                return
            else
                switch_turn
            end
        end

        puts 'Game Over'
        puts 'DRAW'
    end
end
