require 'Game'
require 'TextInput'
require 'TextOutput'
require 'TextValidater'

game 	  = Game.new
input 	  = TextInput.new
output 	  = TextOutput.new
validater = TextValidater.new

player_input = ''
error 		 = ''

output.print_board game.get_display

while ((player_input != 'q') && (game.get_status != false))

	if ((error != true) && (error != ''))
		output.character_error
	end

	output.print_move_prompt
	player_input = input.get_input
	error 		 = validater.move_test(player_input)

	if ((error == true) && (player_input != 'q'))
		error = game.attempt_move player_input.to_i
		output.print_board game.get_display
		
		if (error == false)
			output.taken_error
		else
			game.round_maintenance
   
			if    ((game.get_status == false) && (game.is_won   == true))
					output.game_won(game.get_winner)
			elsif ((game.get_status == false) && (game.is_stale == true))
					output.game_stale
			end
   
   			game.iterate_players
		end
		error = ''

	end
	
	if (player_input == 'q')
		output.game_quit
	end	
end
