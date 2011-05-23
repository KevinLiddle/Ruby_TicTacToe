class MachinePlayer
  
  def initialize(turn)
    @turn = turn
    @tree = MachineAI.new
  end
  
  def get_move(board)
    @tree.minimax(board, @turn)
    return @tree.best_move
  end
  
end