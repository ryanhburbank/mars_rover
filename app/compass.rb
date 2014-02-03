class Compass

	def initialize(hash_of_directions)
		@directions_count = hash_of_directions.length
		@directions       = hash_of_directions.cycle
		@current_facing   = @directions.next
	end

	def set_current_heading(heading)
		until @current_facing[0] == heading
			turn_right!
		end
		current_direction
	end

	def turn_right!
		@current_facing = @directions.next
		current_direction
	end

	def turn_left!
		(@directions_count - 2).times {|int| @directions.next }
		@current_facing = @directions.next
		current_direction
	end

	def current_direction
		"#{@current_facing[0]}"
	end

	def current_move
		@current_facing[1]
	end
end