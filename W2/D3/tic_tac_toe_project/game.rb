require_relative "board"
require_relatice "human_player"

class Game
    def initialize(player1_mark, player2_mark)
        @player1 = player1_mark
        @player2 = player2_mark
        @current_player = @player1
    end

    def board
        @board
    end

    def humman_player
        @human_player
    end

    def switch_turn
        if @curent_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end

    def play
        @board.print
        pos = @current_player.get_position
        @board.place_mark(pos, @current_player)
        if @board.win?
            p "victory"
            return
        end
        self.switch_turn


end