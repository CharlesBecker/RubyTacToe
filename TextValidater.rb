class TextValidater
	
	def initialize
		@validInput = "123456789hq"
	end
	
	def move_test player_input
		if (@validInput.index(player_input))
			result = true
		else
			result = "character error"
		end
		return result
	end
	
end
