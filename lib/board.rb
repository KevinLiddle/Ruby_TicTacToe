class Board
  attr_reader :dimension

  def initialize
    @dimension = 3
    @cell_values = Array.new( @dimension ) { Array.new( @dimension, 0 ) }
  end

  def set_cell_value( row, column, player_marker )
    @cell_values[row][column] = player_marker
  end
  
  def get_cell_value( row, column )
    @cell_values[row][column]
  end
  
  def clear
    (0...@dimension).each do |row|
      (0...@dimension).each do |column|
        set_cell_value(row,column,0)
      end
    end
  end
  
end