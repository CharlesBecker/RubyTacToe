class Game
	
	def initialize (number_of_players = 2)
		
		@game_on = true
		@game_won = false
		@turns = 0
		@player_symbols = ['X', 'Y']
		@player_control = [@player_symbols[0], @player_symbols[1]]
		@number_of_players = number_of_players
		@master = ['', '', '', '', '', '', '', '', '']
		@display_master = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
		@winner = ''
		@stalemate = false
			
	end
	
	# Controls	
	def attempt_move location
		# tries to take the move indicated
		# hook
		
		if(check_move(location))
			take_move location
			contrsuct_display
			return true
		else
			return false
		end
		
	end
	
	def check_move location
		# called by attempt_move
		# internal
		
		if (@master[location-1] != '')
			return false
		else
			return true
		end
	end
	
	def check_three(selection)
		# checks to see if any three win
		# called by win_tests
		# internal
		
		count = 0
		check = 1
		previous = ''
		
		selection.each do |position|
			if (@master[position] != '' && @master[position] == previous)
				check = check + 1
			end
			count = count + 1
			previous = @master[position]
		end
		
		if (check == 3)
			return true
		else
			return false
		end
		
	end
	
	def win_tests
		# uses check_three to see if any combination wins
		# called by round_maintenance
		# internal
		
		result = ''
		
		if    check_three([0, 1, 2])
			result = true		
		elsif check_three([3, 4, 5])
			result =  true
		elsif check_three([6, 7, 8])
			result = true
		elsif check_three([0, 3, 6])
			result = true
		elsif check_three([1, 4, 7])
			result = true
		elsif check_three([2, 5, 8])
			result = true
		elsif check_three([0, 4, 8])
			result = true
		elsif check_three([2, 4, 6])
			result = true
		else
			result = false
		end
		
		result
	end
	
	def stale_test
		# tests for a stalemate
		# called by round_maintenance
		# internal
		
		count = 0
		
		@master.each do |position|
			if (position == '')
				count = count + 1
			end
		end
		
		if (count != 0)
			return false
		else
			set_stale
			return true
		end
		
	end
	
	def round_maintenance
		# tests to see if the game is over
		# hook
		
		if    (win_tests)
			game_over true
		elsif (stale_test)
			game_over false
		end
		
	end
	
	# Mutators
	def iterate_players
		# if turn is completed it sets appropriate player for next play
		# @player_control[0] is current player
		# @player_control[1] is next player
		# hook
		
		if (@player_control[0] == @player_symbols[0])
			@player_control[0] = @player_symbols[1]
			@player_control[1] = @player_symbols[0]
		else
			@player_control[0] = @player_symbols[0]
			@player_control[1] = @player_symbols[1]
		end
	end
	
	def take_move location
		# takes the move specified by the user
		# internal
		
		@master[location-1] = @player_control[0]
	end
	
	def contrsuct_display
		# creates the array which is used by the Output class to 
		# display the board
		# called by
		# internal
		
		count = 0
		@master.each do |position|
			number_display = count + 1
			if (position != '')
				@display_master[count] = position
			else
				@display_master[count] = number_display.to_s
			end
			count = count + 1
		end
	end
	
	def set_winner
		# if game was won this sets which player won
		# internal
		
		@winner = @player_control[0]
	end
	
	def game_over result
		# sets the game to over
		# result = true means game was won
		# result = false means game was not won
		# internal
		
		if (result)
			@game_won = true
			set_winner
		end
		
		@game_on = false
	end
	
	def set_stale
		# sets the game as a stalemate
		# called by stale_test
		# internal
		
		@stalemate = true
	end

	# Accessors
	def get_status
		@game_on
	end
	
	def get_master
		@master
	end
	
	def get_display
		@display_master
	end
	
	def is_won
		@game_won
	end
	
	def is_stale
		@stalemate
	end
	
	def get_winner
		@winner
	end
		
end
