require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#creation of new players
player1 = Player.new("Ordinatueur")
player2 = Player.new("Killing_bot")
human = HumanPlayer.new("José")

#start of the game
puts "Let's begin.."

while player1.life_points > 0 && player2.life_points > 0 do # condition to keep on fighting while the 2 players are alive
puts "Voici l'état des joueurs :"
puts player1.show_state
puts player2.show_state 
puts "\n"
puts "=============> Let's fight <=============== \n\n"
player1.attacks(player2)
puts "\n"
	break if player2.life_points <= 0 #end of the loop if one player die   
player2.attacks(player1)
puts "\n"
end 

