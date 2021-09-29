class Human_player
    def initialize(mark)
        @player = Human_player.new(mark)
    end

    def player
        @player
    end

    def get_position
        p "enter a position with coordinates seperated with a space like `4 7`"
        pos = gets.chomp.split(" ")
        if !Board.valid?(pos)
            p "this is not a valid position, please enter a new position"
            self.get_position
        end
        if !Board.empty?([pos])
            p "this position has already been taken"
            self.get_position
        end
    end

    
end