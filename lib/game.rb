class Game
  attr_reader :player_1, :player_2
  
  def initialize
    @board = Board.new
  end
  
  def play
    set_player_types
    @moves = Moves.new(@board, @player_1, @player_2)
    until GameState.game_over?(@board)
      GameState.print(@board)
      @moves.set_player_move
    end
    GameState.print(@board)
    print_end_of_game_message
  end
  
  def set_player_order
    @first = ""
    while @first != "y" && @first != "n"
      puts "Would you like to go first? (y/n): "
      @first = Kernel::gets.chomp
      if @first == "y"
        @player_1 = HumanPlayer.new
        @player_2 = MachinePlayer.new(-1)
      elsif @first == "n"
        @player_1 = MachinePlayer.new(1)
        @player_2 = HumanPlayer.new
      end
    end
  end
  
  def set_player_types
    @game_type = 0
    while @game_type > 3 || @game_type < 1
      puts "Press (1) for Human vs. Human, (2) for Human vs. Computer, (3) for Computer vs. Computer: "
      @game_type = Kernel::gets.chomp.to_i
      if @game_type == 1
        @player_1 = HumanPlayer.new
        @player_2 = HumanPlayer.new
      elsif @game_type == 2
        set_player_order
      elsif @game_type == 3
        @player_1 = MachinePlayer.new(1)
        @player_2 = MachinePlayer.new(-1)
      end
    end
  end
  
  def print_end_of_game_message
    unless GameState.get_winner(@board) == 0
      puts "Player 1 WINS!" if GameState.get_winner(@board) == 1
      puts "Player 2 WINS!" if GameState.get_winner(@board) == -1
    else
      puts "Tie game."
    end
  end
  
end