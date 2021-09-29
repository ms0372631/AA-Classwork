require_relative "./pieces/piece.rb"
require_relative "./pieces/bishop.rb"
require_relative "./pieces/king.rb"
require_relative "./pieces/knight.rb"
require_relative "./pieces/nullpiece.rb"
require_relative "./pieces/pawn.rb"
require_relative "./pieces/queen.rb"
require_relative "./pieces/rook.rb"

class Board

  attr_accessor :rows

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    populate
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end

  def valid_pos?(pos)
    row, col = pos
    return false if !row.between?(0,7) || !col.between?(0,7)
    true
  end

  def add_piece(piece, pos)
    if valid_pos?(pos)
      self[pos] = piece
    else
      raise "can not add piece!"
    end
  end

  def checkmate?(color)
    king_pos = find_king(color)
    king_moves = @board[king_pos].valid_moves
    king_moves.all? {|pos| under_attack(pos, color) }
  end

  def under_attack(pos, color)
    (0..7).each do |r|
      (0..7).each do |c|
        piece_pos = [r,c]
        piece = self[piece_pos]
        if piece.color != color && piece.color != "none"
          return true if piece.valid_moves.include?(king_pos)
        end
      end
    end
    false
  end

  def in_check?(color)
    king_pos = find_king(color)
    #get all moves for other color pieces
    #check if any moves include current_king_pos
    (0..7).each do |r|
      (0..7).each do |c|
        piece_pos = [r,c]
        piece = self[piece_pos]
        if piece.color != color && piece.color != "none"
          return true if piece.valid_moves.include?(king_pos)
        end
      end
    end
    false
  end

  def find_king(color)
    (0..7).each do |r|
      (0..7).each do |c|
        return [r,c] if self[[r,c]].color == color && self[[r,c]].symbol == :King
      end
    end
  end

  def move_piece!(start_pos, end_pos)
    raise "no piece at #{start_pos}" if self[start_pos].color == "none"
    raise "cannot move to #{end_pos}" if !self[start_pos].valid_moves.include?(end_pos)
    piece = self[start_pos]
    self[end_pos] = piece
    piece.pos = [end_pos]
    self[start_pos] = Nullpiece.instance
  end


  def populate
    (0..7).each do |j|
      @rows[1][j] = Pawn.new("black", self, [1, j])
      @rows[6][j] = Pawn.new("white", self, [6, j])
    end

    [2,3,4,5].product((0..7).to_a).each do |pos|
      r, c = pos
      @rows[r][c] = Nullpiece.instance
    end
    
    @rows[0][0] = Rook.new("black", self, [0,0])
    @rows[0][7] = Rook.new("black", self, [0,7])
    @rows[7][0] = Rook.new("white", self, [7,0])
    @rows[7][7] = Rook.new("white", self, [7,7])

    @rows[0][1] = Knight.new("black", self, [0,1])
    @rows[0][6] = Knight.new("black", self, [0,6])
    @rows[7][1] = Knight.new("white", self, [7,1])
    @rows[7][6] = Knight.new("white", self, [7,6])

    @rows[0][2] = Bishop.new("black", self, [0,2])
    @rows[0][5] = Bishop.new("black", self, [0,5])
    @rows[7][2] = Bishop.new("white", self, [7,2])
    @rows[7][5] = Bishop.new("white", self, [7,5])

    @rows[0][3] = Queen.new("black", self, [0,3])
    @rows[7][3] = Queen.new("white", self, [7,3])

    @rows[0][4] = King.new("black", self, [0,4])
    @rows[7][4] = King.new("white", self, [7,4])

  end

  # def print
  #   puts " #{(0..7).to_a.join(' ')}"
  #   @rows.each.with_index do |row,i|
  #     output = row.map {|piece| piece.to_s}
  #     puts "#{i} #{output.join(' ')}"
  #   end
  # end

end