require_relative "piece.rb"
require_relative "stepable.rb"

class Knight < Piece

include Stepable

attr_reader :diff

  def initialize(color, board, pos)
    super
    @diff = ""
    move_diffs
  end

  def symbol
    :knight
  end

  protected

  def move_diffs
    self.knight_diffs
  end

end