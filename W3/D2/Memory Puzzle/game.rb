require_relative "./board.rb"
require_relative "./player.rb"

require 'byebug'

class Game
    def initialize
        @board = Board.new(3)
        @board.populate
        @player1 = Player.new(3, "Owen")
        @player2 = Player.new(3, "Alan")
        @currentPlayer = @player1
    end

    def switch_player
        if @currentPlayer == @player1
            @currentPlayer = @player2
        else
            @currentPlayer = @player1
        end
    end



    def take_turn
        @board.render
        not_found = true
        while not_found
            pos = @currentPlayer.get_position
            row, col = pos
            debugger if not @board.empty_grid[row][col]
            if @board.empty_grid[row][col].has_flipped 
                print "Card has already been flipped, try again"
                print "\n"
            else 
                @board.empty_grid[row][col].flip
                if @board.won?
                    puts "you win" 
                    return @board.empty_grid[row][col]
                else
                    return @board.empty_grid[row][col]
                end
                not_found = false
            end 
        end
    end

    def play_round
        turn = self.take_turn
        turn2 = self.take_turn
        if turn.char == turn2.char
            @currentPlayer.cards[turn.char] += 2
        else
            @board.render
            print "----------------------"
            print "\n"
            turn.flip
            turn2.flip
        end
        self.switch_player
    end

    def play_game
        # debugger
        until @board.all_pairs_flipped
            self.play_round
        end
        if @player1.cards.keys.count > @player2.cards.keys.count
            print "Player 1 wins!"
        elsif @player1.cards.keys.count == @player2.cards.keys.count
            print "TIE!"
        else
            print "Player2 Wins!"
        end
    end

end