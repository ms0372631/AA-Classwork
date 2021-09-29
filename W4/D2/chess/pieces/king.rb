require_relative "piece.rb"
require_relative "stepable.rb"

class King < Piece

include Stepable

attr_reader :diff

  def initialize(color, board, pos)
    super
    @diff = ""
    move_diffs
  end

  def symbol
    :King
  end

  protected

  def move_diffs
    self.king_diffs
  end

end