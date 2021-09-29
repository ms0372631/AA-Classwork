
require_relative "piece.rb"
require_relative "slideable.rb"

class Queen < Piece

include Slideable

attr_reader :direction

  def initialize(color, board, pos)
    super
    @direction = ""
    move_dirs
  end

  def symbol
    :Queen
  end

  private

  def move_dirs
    self.queen_dirs
  end

end
