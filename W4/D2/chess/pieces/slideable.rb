require "byebug"

module Slideable

  HORIZTONAL_DIRS = [[0,1],[0,-1],[-1,0],[1,0]]
  DIAGONAL_DIRS = [[1,1],[-1,-1],[1,-1],[-1,1]]

  attr_reader :direction

  def queen_dirs
    @direction = "queen_dir"
  end

  def horizontal_dirs
    @direction = "horizontal"
  end

  def diagonal_dirs
    @direction = "diagonal"
  end


  def moves
    result = []
    if direction == "horizontal"
      start_pos = self.pos
      HORIZTONAL_DIRS.each do |dir_pos|
        move_pos = start_pos
        # while move_pos[0].between?(0,7) && move_pos[1].between?(0,7)
        while @board.valid_pos?(move_pos)
          move_pos = plus_dir(move_pos, dir_pos)
          if @board.valid_pos?(move_pos) && @board[pos].empty?
            result << move_pos
          elsif @board.valid_pos?(move_pos) && @board[pos].color != self.color
            result << move_pos
            break
          else
            break
          end
          # if move_pos[0].between?(0,7) && move_pos[1].between?(0,7)
          #   result << move_pos 
          # end
        end
      end

    elsif direction == "diagonal"
      start_pos = self.pos
      DIAGONAL_DIRS.each do |dir_pos|
        move_pos = start_pos
        while @board.valid_pos?(move_pos)
          move_pos = plus_dir(move_pos, dir_pos)
          if @board.valid_pos?(move_pos) && @board[pos].empty?
            result << move_pos
          elsif @board.valid_pos?(move_pos) && @board[pos].color != self.color
            result << move_pos
            break
          else
            break
          end
        end
        # while move_pos[0].between?(0,7) && move_pos[1].between?(0,7)
        #   move_pos = plus_dir(move_pos, dir_pos)
        #   result << move_pos if move_pos[0].between?(0,7) && move_pos[1].between?(0,7)
        # end
      end
    else
      start_pos = self.pos
       (HORIZTONAL_DIRS + DIAGONAL_DIRS).each do |dir_pos|
        move_pos = start_pos
        while @board.valid_pos?(move_pos)
          move_pos = plus_dir(move_pos, dir_pos)
          if @board.valid_pos?(move_pos) && @board[pos].empty?
            result << move_pos
          elsif @board.valid_pos?(move_pos) && @board[pos].color != self.color
            result << move_pos
            break
          else
            break
          end
        end
        # while move_pos[0].between?(0,7) && move_pos[1].between?(0,7)
        #   move_pos = plus_dir(move_pos, dir_pos)
        #   result << move_pos if move_pos[0].between?(0,7) && move_pos[1].between?(0,7)
        # end
      end
    end
    result
  end

  private

  def plus_dir(pos, dir_pos)
    [pos, dir_pos].transpose.map(&:sum)
  end

  # def move_dirs
    
  # end

  def grow_unblocked_moves_in_dir(dx, dy)

  end

end