class Compass

	def initialize(array_of_directions)
		@array          = array_of_directions
		@direction      = array_of_directions.cycle
		@current_facing = @direction.next
	end

	def set_current_heading(heading)
		return "Inputed Heading Invalid!" unless @array.include?(heading)
		until @current_facing == heading
			turn_right!
		end
		current_direction
	end

	def turn_right!
		@current_facing = @direction.next
	end

	def turn_left!
		(@array.length - 2).times {|int| @direction.next }
		@current_facing = @direction.next
	end

	def current_direction
		"#{@current_facing}"
	end
end