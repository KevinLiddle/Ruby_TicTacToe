module GameState
  
  def self.each_cell(game_board)
    (0...game_board.dimension).each do |row|
      (0...game_board.dimension).each do |column|
        yield(row, column)
      end
    end
  end

  def self.print(game_board)
    each_cell(game_board) do |row, column|
      puts "" if column == 0 && row == 0
      putc "["
      putc "X" if game_board.get_cell_value(row,column) == 1
      putc "O" if game_board.get_cell_value(row,column) == -1
      putc " " if game_board.get_cell_value(row,column) == 0
      putc "]"
      puts "" if column == game_board.dimension - 1
    end
  end
  
  def self.winning_line?(game_board, consecutive_markers)
    consecutive_markers.abs == game_board.dimension
  end
  
  def self.update_consecutive_markers(game_board, consecutive_markers, row, column)
    consecutive_markers += game_board.get_cell_value(row,column)
  end
  
  def self.has_horizontal_winner?(game_board)
    consecutive_markers = 0
    each_cell(game_board) do | row, column |
      consecutive_markers = 0 if column.zero?
      consecutive_markers = update_consecutive_markers(game_board, consecutive_markers, row, column)
      return consecutive_markers if winning_line?(game_board, consecutive_markers)
    end
    return 0
  end
  
  def self.has_vertical_winner?(game_board)
    consecutive_markers = 0
    each_cell(game_board) do | column, row |
      consecutive_markers = 0 if row.zero?
      consecutive_markers = update_consecutive_markers(game_board, consecutive_markers, row, column)
      return consecutive_markers if winning_line?(game_board, consecutive_markers)
    end
    return 0
  end
  
  def self.check_diagonal_winner(game_board, index_of_left_diagonal)
    consecutive_markers = 0
    (0...game_board.dimension).each do |cell|
      consecutive_markers = 0 if cell.zero?
      consecutive_markers = update_consecutive_markers(game_board, consecutive_markers, (index_of_left_diagonal - cell).abs, cell)
      return consecutive_markers if winning_line?(game_board, consecutive_markers)
    end
    return 0
  end
  
  def self.has_diagonal_winner?(game_board)
    @markers = check_diagonal_winner(game_board, 0)
    return @markers if @markers.abs == game_board.dimension
    return check_diagonal_winner(game_board, game_board.dimension - 1)
  end
  
  def self.total_moves(game_board)
    @total = 0
    each_cell(game_board) do |row, column|
      @total += 1 if game_board.get_cell_value(row,column) != 0
    end
    return @total
  end
  
  def self.has_full_board?(game_board)
    total_moves(game_board) == game_board.dimension*game_board.dimension
  end
  
  def self.empty_board?(game_board)
    total_moves(game_board) == 0
  end
  
  def self.game_over?(game_board)
    has_vertical_winner?(game_board).abs == game_board.dimension || has_horizontal_winner?(game_board).abs == game_board.dimension || has_diagonal_winner?(game_board).abs == game_board.dimension || has_full_board?(game_board)
  end
  
  def self.get_winner(game_board)
    if game_over?(game_board)
      @horizontal = has_horizontal_winner?(game_board)/game_board.dimension
      @vertical = has_vertical_winner?(game_board)/game_board.dimension
      @diagonal = has_diagonal_winner?(game_board)/game_board.dimension
      return @horizontal | @vertical | @diagonal
    end
  end
  
end