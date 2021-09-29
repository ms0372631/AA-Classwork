class Player
    def get_move
        puts "enter a position with coordinates separeated with a space like '4 7'"
        pos = [gets.chomp.split(" ")[0].to_i, gets.chomp.split(" ")[1].to_i]
    end
end
