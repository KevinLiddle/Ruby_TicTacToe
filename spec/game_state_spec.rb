require "game_state"

describe GameState do

  before(:each) do
    @board = Board.new
  end

  it "checks a blank board for a horizontal winner" do
    GameState.has_horizontal_winner?(@board).should == 0
  end
  
  it "checks blank board for winner" do
    GameState.game_over?(@board).should be_false
  end
  
  it "checks a board with a horizontal win" do
    (0..2).each do |cell|
      @board.set_cell_value(0, cell, 1)
    end
    GameState.has_horizontal_winner?(@board).should be_true
  end
  
  it "checks for horizontal win" do
    (0..2).each do |cell|
      @board.set_cell_value(2, cell, 1)
    end
    GameState.has_horizontal_winner?(@board).should be_true
  end
  
  it "checks for a vertical win" do
    (0..2).each do |cell|
      @board.set_cell_value(cell, 1, 1)
    end
    GameState.has_vertical_winner?(@board).should be_true
  end
  
  it "checks for a win on first diagonal" do
    (0..2).each do |cell|
      @board.set_cell_value(cell, cell, 1)
    end
    GameState.has_diagonal_winner?(@board).should be_true
  end
  
  it "checks for a win on second diagonal" do
    (0..2).each do |cell|
      @board.set_cell_value(@board.dimension - cell - 1, cell, 1)
    end
    GameState.has_diagonal_winner?(@board).should be_true
  end
  
  it "checks for various winners" do
    (0..2).each do |cell|
      @board.set_cell_value(1, cell, 1)
    end
    GameState.game_over?(@board).should be_true
    
    @board.clear
    (0..2).each do |cell|
      @board.set_cell_value(cell, 2, 1)
    end
    GameState.game_over?(@board).should be_true
    
    @board.clear
    (0..2).each do |cell|
      @board.set_cell_value(@board.dimension - cell - 1, cell, 1)
    end
    GameState.game_over?(@board).should be_true
  end
  
  it "checks for a full board" do
    @board.set_cell_value(0,0,1)
    @board.set_cell_value(0,1,-1)
    @board.set_cell_value(0,2,1)
    @board.set_cell_value(1,0,1)
    @board.set_cell_value(1,1,-1)
    @board.set_cell_value(1,2,-1)
    @board.set_cell_value(2,0,-1)
    @board.set_cell_value(2,1,1)
    @board.set_cell_value(2,2,1)
    GameState.game_over?(@board).should be_true
  end
  
  it "returns the value of the winner" do
    @board.set_cell_value(0,0,1)
    @board.set_cell_value(0,1,-1)
    @board.set_cell_value(0,2,1)
    @board.set_cell_value(1,0,1)
    @board.set_cell_value(1,1,-1)
    @board.set_cell_value(1,2,-1)
    @board.set_cell_value(2,0,1)
    @board.set_cell_value(2,1,0)
    @board.set_cell_value(2,2,-1)
    GameState.get_winner(@board).should == 1
  end
end