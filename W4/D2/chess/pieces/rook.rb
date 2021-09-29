require_relative "piece.rb"
require_relative "slideable.rb"

class Rook < Piece

include Slideable

attr_reader :direction

  def initialize(color, board, pos)
    super
    @direction = ""
    move_dirs
  end

  def symbol
    :Rook
  end

  private

  def move_dirs
    self.horizontal_dirs
  end

end
