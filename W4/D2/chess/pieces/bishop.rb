require_relative "piece.rb"
require_relative "slideable.rb"

class Bishop < Piece

include Slideable

attr_reader :direction

  def initialize(color, board, pos)
    super
    @direction = ""
    move_dirs
  end

  def symbol
    :Bishop
  end

  private

  def move_dirs
    self.diagonal_dirs
  end

end
