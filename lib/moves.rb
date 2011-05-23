class Moves
  attr_reader :player_turn
  
  def initialize( board, player_1, player_2)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @player_turn = 1
  end
  
  def change_player_turn
    @player_turn *= -1
  end
  
  def set_player_move
    if @player_turn == 1
      @move = @player_1.get_move(@board)
      @board.set_cell_value(@move[0], @move[1], @player_turn)
    elsif @player_turn == -1
      @move = @player_2.get_move(@board)
      @board.set_cell_value(@move[0], @move[1], @player_turn)
    end
    change_player_turn
  end
  
end