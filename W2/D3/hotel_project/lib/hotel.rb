require_relative "room"

class Hotel
    def initialize(name, hash)
        @name = name
        @rooms = Hash.new(0)
        hash.each do |k, v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        res = @name.split(" ").map {|a| a.capitalize}
        res.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(name)
        @rooms.has_key?(name)
    end

    def check_in(person, room)
        if !self.room_exists?(room)
            puts "sorry, room does not exist"
        else
            if !@rooms[room].full?
                @rooms[room].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        @rooms.each do |k, v|
            return true if !@rooms[k].full?
        end
        false
    end

    def list_rooms
        @rooms.each do |k, v|
            puts "#{k} : #{@rooms[k].available_space}"
        end
    end
end
