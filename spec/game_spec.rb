require "game"

describe Game do
  
  before(:each) do
    @game = Game.new
  end
  
  it "gets the player turn order" do
    Kernel.should_receive(:gets).and_return("y")
    @game.set_player_order
    @game.player_1.instance_of?(HumanPlayer).should be_true
    @game.player_2.instance_of?(MachinePlayer).should be_true
  end
  
  it "sets player types" do
    Kernel.should_receive(:gets).and_return("1")
    @game.set_player_types
    @game.player_1.instance_of?(HumanPlayer).should be_true
    @game.player_2.instance_of?(HumanPlayer).should be_true
    
    Kernel.should_receive(:gets).and_return("2")
    Kernel.should_receive(:gets).and_return("n")
    @game.set_player_types
    @game.player_1.instance_of?(MachinePlayer).should be_true
    @game.player_2.instance_of?(HumanPlayer).should be_true
    
    Kernel.should_receive(:gets).and_return("3")
    @game.set_player_types
    @game.player_1.instance_of?(MachinePlayer).should be_true
    @game.player_2.instance_of?(MachinePlayer).should be_true
  end
  
end