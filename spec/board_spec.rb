require "board"

describe Board do
  
  before(:each) do
    @board = Board.new
  end
  
  it "creates a board" do
    !@board.should.nil?
  end
  
  it "sets board cell to given value" do
    @board.set_cell_value(1,2,1)
    @board.get_cell_value(1,2).should == 1
  end
  
  it "finds value of given cell" do
    @board.set_cell_value(0,1,1)
    @board.get_cell_value(0,1).should == 1
  end

end