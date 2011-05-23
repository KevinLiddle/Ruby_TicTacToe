class HumanPlayer
  
  def get_move(board)
    @user_input = [-1,-1]
    while !valid_move?(@user_input[0],@user_input[1], board)
      @user_input = get_input
    end
    return @user_input
  end
  
  def valid_move?(row,column, board)
    valid_index?(row,column, board) && board.get_cell_value(row, column) == 0 && !GameState.game_over?(board)
  end
  
  def valid_index?(row, column, board)
    return (row < board.dimension && column < board.dimension && row >= 0 && column >= 0)
  end
  
  def get_input
    @input = Array.new
    print "Enter row(1-3): "
    @input << Kernel::gets.chomp.to_i
    print "Enter column(1-3): "
    @input << Kernel::gets.chomp.to_i
    @input[0] -= 1
    @input[1] -= 1
    return @input
  end
  
end