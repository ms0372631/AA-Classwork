class ComputerPlayer
    attr_reader :mark

    def initialize(val)
        @mark = val
    end

    def get_position(legal_positions)
        choice = legal_positions.sample
        puts "Computer #{self.mark} chose position #{choice.to_s}"
        choice
    end
end
