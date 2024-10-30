class Play
  attr_reader :player_board, :computer_board

  def initialize
    @player_board = Board.new
    @computer_board= Board.new
  end

  def computer_setup
    cruiser_placement = @computer_board.cells.keys.sample(3)
    #cruiser_placement = ["A1", "A2", "A3"]
    while @computer_board.valid_placement?(Ship.new("cruiser", 3), cruiser_placement) == false
      cruiser_placement = @computer_board.cells.keys.sample(3)
      @computer_board.valid_placement?(Ship.new("cruiser", 3), cruiser_placement)
    end
    @computer_board.place(Ship.new("cruiser", 3), cruiser_placement)

    submarine_placement = @computer_board.cells.keys.sample(2)
    #submarine_placement = ["B1", "B2"]
    while @computer_board.valid_placement?(Ship.new("submarine", 2), submarine_placement)
      submarine_placement = @computer_board.cells.keys.sample(2)
      @computer_board.valid_placement?(Ship.new("submarine", 2), submarine_placement)
    end
    @computer_board.place(Ship.new("submarine", 2), submarine_placement)
  end
   
  def player_setup
    puts "I have laid out my ships on the grid. \n" + "You now need to lay out your two ships. \n" + "The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.render(true)


    puts "Enter the squares for the Cruiser (3 spaces):"
    #cruiser_coordinates = gets.chomp
    cruiser_coordinates = "A1 A2 A4"
    while @player_board.valid_placement?(Ship.new("cruiser", 3), cruiser_coordinates.split(" ")) == false
      puts "Those are invalid coordinates. Please try again:"
      #cruiser_coordinates = gets.chomp
      cruiser_coordinates = "A1 A2 A3"
      @player_board.valid_placement?(Ship.new("cruiser", 3), cruiser_coordinates.split(" "))
    end
    @player_board.place(Ship.new("cruiser", 3), cruiser_coordinates.split(" "))
    puts @player_board.render(true)


    puts "Enter the squares for the Submarine (2 spaces):"
    #submarine_coordinates = gets.chomp
    submarine_coordinates = "B1 B2"
    while @player_board.valid_placement?(Ship.new("submarine", 2), submarine_coordinates.split(" ")) == false
      puts "Those are invalid coordinates. Please try again:"
      #submarine_coordinates = gets.chomp
      submarine_coordinates = "B1 B2"
      @player_board.valid_placement?(Ship.new("submarine", 2), submarine_coordinates.split(" "))
    end
    player_board.place(Ship.new("submarine", 2), submarine_coordinates.split(" "))
    puts @player_board.render(true)
  end
  
  def turn

  end

  def game_over
    if @player_board.all_ships_sunk == true
      return true
    elsif @computer_board.all_ships_sunk == true
      return true
    else
      return false
    end
  end
end