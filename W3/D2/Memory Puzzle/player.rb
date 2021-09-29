class Player

    attr_reader :cards, :name

    def initialize(n, name)
        @cards = Hash.new(0)
        @n = n
        @name = name 
    end

    def get_position
        print "Please enter a position #{self.name}:"
        pos = gets.chomp 
        pos = pos.split(" ")
        pos = pos.map{|ele| ele.to_i}
        pos.each do |ele| 
            if ele > @n - 1
                print "Invalid position, try again."
                print "\n"
                pos = self.get_position
                break   
            end 
        end
        return pos 
    end
end