class Flight
     attr_reader :passengers

    def initialize(num, cap)
        @flight_number = num
        @capacity = cap
        @passengers = []
    end

    def full?
        @passengers.length >= @capacity
    end

    def board_passenger(passenger)
        if passenger.has_flight?(@flight_number) && !self.full?
            @passengers << passenger
        end
    end

    def list_passengers
        @passengers.map {|p| p.name}
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end

    
end