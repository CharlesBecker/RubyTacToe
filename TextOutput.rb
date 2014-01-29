class TextOutput

	def initialize
		@move_prompt = "Please enter a valid move (q = quit)"
	end
	
	def print_prompt prompt
		print prompt + " "
	end
	
	def print_move_prompt
		print_prompt @move_prompt
	end
	
	def test_output output
		puts output
	end
	
	def print_board master_list
		line1 = '   |   |   '
		line2 = '---|---|---'
		puts line1
		puts " " + master_list[0] + " | " + master_list[1] + " | " + master_list[2]
		puts line1
		puts line2
		puts line1
		puts " " + master_list[3] + " | " + master_list[4] + " | " + master_list[5]
		puts line1
		puts line2
		puts line1
		puts " " + master_list[6] + " | " + master_list[7] + " | " + master_list[8]
		puts line1
	end
	
	def game_won winner
		puts "Congratulations, " + winner + "!  You won!"
	end
	
	def game_stale
		puts "No one won :("
	end
	
	def game_quit
		puts "Play again soon!"
	end 
	
	def character_error
		puts "Please enter a valid selection!"
	end
	
	def taken_error
		puts "That location is already taken!  Try another!"
	end
	
end
