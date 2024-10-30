class Play
  attr_reader :player_board, :computer_board

  def initialize
    @player_board = Board.new
    @computer_board= Board.new
  end

  def setup
    puts "I have laid out my ships on the grid. \n" + "You now need to lay out your two ships. \n" + "The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.render(true)
    puts "Enter the squares for the Cruiser (3 spaces):"
    gets.chomp
    puts @player_board.render(true)
    puts "Enter the squares for the Submarine (2 spaces): \n"

  end
  def turn
    
  end

  def end_game
    
  end

end