class Compass

	def initialize(array_of_directions)
		@array          = array_of_directions
		@direction      = array.cycle
		@current_facing = @direction.next
	end

	def turn_right
		@current_facing = @direction.next
	end

	def turn_left
		(@array.length - 2).times {|int| @direction.next }
		@current_facing = @direction.next
	end

	def current_direction
		"#{@current_facing.upcase}"
	end
end