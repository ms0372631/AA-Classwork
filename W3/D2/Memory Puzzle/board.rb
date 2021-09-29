require_relative "./card.rb"
require 'byebug'

class Board

    attr_reader :empty_grid

    def self.empty_grid(n)
        Array.new(n) {Array.new(n)}
    end

    def initialize(n)
        @empty_grid = Board.empty_grid(n)
        @n = n
    end

    def populate
        cards_to_fill = []
        used = []
        count = 0
        while count < @n**2 / 2 do 
            card = Card.random
            if not used.include?(card.char)
              used << card.char
              card2 = card.clone
              cards_to_fill.concat([card, card2])
              count += 1
            end 
        end
        cards_to_fill << Card.random
        cards_to_fill = cards_to_fill.shuffle
        count = 0
        @empty_grid.each_with_index do |row, i|
            row.each_with_index do |ele, j|
                @empty_grid[i][j] = cards_to_fill[count]
                count += 1
            end
        end
    #   pair_nums = @n**2/2 
    #   counter = 0
    #   debugger 
    #   while counter < pair_nums
    #     char = Card.random 
    #     random_index_i, random_index_j = rand((0...@n)), rand((0...@n))
    #     @empty_grid[random_index_i][random_index_j] = Card.random 
    #   end
    end

    def render
      @empty_grid.each do |row|
        row.each do |ele|
            if ele.has_flipped
                print ele.char + " " 
            else
                print "  "
            end
        end
        puts "\n"
      end
    end

    def won?
        @empty_grid.each do |row|
            return false if row.any?{|ele| not ele.has_flipped}
        end
        true 
    end

    def all_pairs_flipped
        count = 0
        @empty_grid.each do |row|
            row.each do |ele|
                count += 1 if ele.has_flipped
            end
        end
        if @n**2 - 1 > count
            return false
        end
        true
    end
end