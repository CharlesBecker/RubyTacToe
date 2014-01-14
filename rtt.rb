require 'Game'
require 'TextInput'
require 'TextOutput'
require 'TextValidater'

game = Game.new
input = TextInput.new
output = TextOutput.new
validater = TextValidater.new

player_input = ''

output.print_board game.get_display

while (player_input != '0' && game.get_status != false)
	output.print_move_prompt
	player_input = input.get_input
	game.attempt_move player_input.to_i
	output.print_board game.get_display
	game.round_maintenance
	
	if    (game.get_status == false && game.is_won == true)
		output.game_won(game.get_winner)
	elsif (game.get_status == false && game.is_stale == true)
		output.game_stale
	elsif (game.get_status == false)
		output.game_quit
	end
	
	game.iterate_players
end
