require './lib/play.rb'
require './lib/board.rb'
require './lib/cell.rb'
require './lib/ship.rb'

puts "Welcome to BATTLESHIP \n" + "Enter p to play. Enter q to quit."
player_input = gets.chomp
if player_input == "p"
  play = Play.new
  play.setup
  play.turn
end