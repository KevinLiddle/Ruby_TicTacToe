require "moves"
require "game_state"

describe Moves do
  
  before(:each) do
    @board = Board.new
    @player_1 = MachinePlayer.new(1)
    @player_2 = MachinePlayer.new(-1)
    @moves = Moves.new(@board, @player_1, @player_2)
  end
  
  it "returns whose turn it is" do
    @moves.player_turn.should == 1
  end
  
  it "alternates whose turn it is" do
    @moves.change_player_turn
    @moves.player_turn.should == -1
  end
  
  it "sets a board cell with the player turn value" do
    @moves.set_player_move
    @board.get_cell_value( 1, 1 ).should == 1
    
    @moves.set_player_move
    @board.get_cell_value( 0, 0 ).should == -1
  end
  
  it "doesn't change an existing player piece on the board" do
    @moves.set_player_move
    @moves.set_player_move
    @board.get_cell_value( 1, 1 ).should == 1
    @board.get_cell_value( 0, 0 ).should == -1
  end
  
  it "plays a game between two computers" do
    until GameState.game_over?(@board)
      @moves.set_player_move
      GameState.print(@board)
    end
    GameState.get_winner(@board).should == 0
  end
  
end