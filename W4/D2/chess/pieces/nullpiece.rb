
require_relative "piece.rb"
require 'singleton'

class Nullpiece < Piece

    include Singleton

    attr_reader :color, :symbol

    def initialize
        @color = "none"
    end

    def moves
        (0..7).to_a.product((0..7).to_a)
    end
    
    def symbol
        :_
    end

end