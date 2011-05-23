class MachineAI
  attr_reader :best_move
  
  def initialize
    @best_move = Array.new
  end
  
  def minimax(board, turn, depth = 0)
    return take_middle if GameState.empty_board?(board)
    return weight_winners(board, depth) if GameState.game_over?(board)
    possible_moves = Array.new
    moves_scores = Array.new
    GameState.each_cell(board) do |row, column|
      if board.get_cell_value(row,column) == 0
        board.set_cell_value(row,column,turn)
        possible_moves << [row,column]
        moves_scores << minimax(board, -1*turn, depth + 1)
        board.set_cell_value(row,column,0)
      end
    end
    set_best_move(possible_moves, moves_scores, turn)
    return set_score_of_path(moves_scores)
  end
  
  def take_middle
    @best_move = [1,1]
    return 0
  end
  
  def weight_winners(board, depth)
    return GameState.get_winner(board)*1000 if depth <= 2
    return GameState.get_winner(board)
  end
  
  def set_best_move(possible_moves, moves_scores, turn)
    @best_path = 0
    (0...moves_scores.size).each do |index|
      @best_path = index if turn == 1 && moves_scores[index] > moves_scores[@best_path]
      @best_path = index if turn == -1 && moves_scores[index] < moves_scores[@best_path]
    end
    @best_move = possible_moves[@best_path]
  end
  
  def set_score_of_path(moves_scores)
    @total_score = 0
    (0...moves_scores.size).each do |index|
      @total_score += moves_scores[index]
    end
    return @total_score
  end

end