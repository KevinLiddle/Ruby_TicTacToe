require "machine_ai"

describe MachineAI do
  
  before(:each) do
      @node = MachineAI.new
      @board = Board.new
      @turn = 1
    end
    
    it "should win when it can" do
      @board.set_cell_value(0,0,1)
      @board.set_cell_value(0,1,1)
      @board.set_cell_value(0,2,-1)
      @board.set_cell_value(1,0,1)
      @board.set_cell_value(1,1,0)
      @board.set_cell_value(1,2,-1)
      @board.set_cell_value(2,0,0)
      @board.set_cell_value(2,1,-1)
      @board.set_cell_value(2,2,0)
      @node.minimax(@board,@turn)
      
      @node.best_move.should == [2,0]
    end
    
    it "should return the best move available" do
      @possible_moves = [[0,0],[1,1],[2,1]]
      @moves_scores = [8,-1,4]
      @turn = -1
      @node.set_best_move(@possible_moves, @moves_scores, @turn)
      @node.set_score_of_path(@moves_scores).should == 11
      @node.best_move.should == [1,1]
    end
      
end