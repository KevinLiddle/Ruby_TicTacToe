require "human_player"

describe HumanPlayer do
  
  before(:all) do
    @player = HumanPlayer.new
    @board = Board.new
  end
  
  it "should take user input and make a move" do
    Kernel.should_receive(:gets).twice.and_return("1")
    @player.get_move(@board).should == [0,0]
  end
  
  it "should not take an invalid space" do
    Kernel.should_receive(:gets).twice.and_return("4")
    Kernel.should_receive(:gets).twice.and_return("1")
    @player.get_move(@board).should == [0,0]
  end
  
end