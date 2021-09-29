
class Game
    def initialize
        @fragment=[]
        @player1= Player.new
        @player2=Player.new
        @dictionary ={}
        File.readlines('dictionary.txt').each do |line|
            @dictionary[line]= 0
        end
    end
end

