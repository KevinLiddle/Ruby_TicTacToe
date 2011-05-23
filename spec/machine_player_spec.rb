require "machine_player"

describe MachinePlayer do
  
  before(:each) do
    @board = Board.new
    @machine = MachinePlayer.new(1)
  end
  
  it "should return next best move" do
    @board.set_cell_value(0,0,1)
    @board.set_cell_value(0,1,1)
    @board.set_cell_value(0,2,-1)
    @board.set_cell_value(1,0,1)
    @board.set_cell_value(1,1,0)
    @board.set_cell_value(1,2,-1)
    @board.set_cell_value(2,0,0)
    @board.set_cell_value(2,1,-1)
    @board.set_cell_value(2,2,0)

    @machine.get_move(@board).should == [2,0]
  end
  
end