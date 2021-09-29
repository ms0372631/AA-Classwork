class Card
    attr_reader :char, :has_flipped

    POSSIBLE_CARDS = ["A", "G", "J", "T", "U"]
    def self.random
        card = Card.new(POSSIBLE_CARDS.sample)
    end

    def initialize(char)
        @char = char
        @has_flipped = false
    end

    def flip
        if @has_flipped
            @has_flipped = false
        else 
            @has_flipped = true
        end 
    end

end