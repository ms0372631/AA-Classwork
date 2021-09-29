
class Piece

  attr_reader :color, :pos
  attr_accessor :board

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def symbol
    @symbol
  end

  def to_s
    self.symbol.to_s[0]
  end

  def empty?
    r, c = pos
    return true if @board[r][c].is_a?(Nullpiece)
    false
  end

  def valid_moves
    result = []
    self.moves.each do |pos|
      if @board[pos].color == "none"
        result << pos
      end
    end
    result
  end

  def pos=(val)
    @pos = val
  end
  
 

  private

  def move_into_check?(end_pos)
    king_pos = @board.find_king(color)
    dup = self.dup
    dup.pos = end_pos
    dup.valid_moves.include?(king_pos)
  end

end