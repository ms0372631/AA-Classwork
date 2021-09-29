require_relative "board.rb"
require_relative "cursor.rb"
require "colorize"

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    print
    curs = @cursor.get_input
    system("clear")
    puts "Use arrow key to move around"
    
    #print the board
    while curs.nil? || curs.is_a?(Array)
      print
      curs = @cursor.get_input
      system("clear")
    end
    
    #show the cursor, 
    #cursor.get_input
    #show the cursor
  end

  def print
    puts "  #{(0..7).to_a.join(' ')}"
    @board.rows.each.with_index do |row,i|
      output = row.map.with_index do |piece, j| 
        if [i,j] == @cursor.cursor_pos
          piece.to_s.colorize(:green)
        elsif piece.color == "black"
          piece.to_s.colorize(:blue)
        elsif piece.color == "white"
          piece.to_s.colorize(:red)
        else
          "_"
        end
      end
      puts "#{i} #{output.join(' ')}"
    end
  end

end

d = Display.new(Board.new)
d.render