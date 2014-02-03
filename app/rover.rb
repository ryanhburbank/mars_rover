require_relative './compass'

class Rover
	
	DIRECTIONS  = { "n" => [0,1], "e" => [1,0], "s" => [0,-1], "w" => [-1,0] }
	
	def initialize(orders, plateau, direction_hash = nil)
		@orders              = orders
		@moves               = orders[:moves].each
		@boundaries          = plateau.dimensions
		
		@compass             = Compass.new(direction_hash || DIRECTIONS)	
		set_compass_to_heading
	end

	def position
		@orders[:position]
	end

	def move_all!
		move_count.times { move_once! }
		@orders[:position]
	end

	def moves_list
		"#{@moves.to_a.join(', ')}"
	end

	private

	def set_compass_to_heading
		@compass.set_current_heading(@orders[:position][:heading])
	end

	def move_once!
		begin
			current_move = @moves.next
			case current_move
			when "l"
				@orders[:position][:heading] = @compass.turn_left!
			when "r"
				@orders[:position][:heading] = @compass.turn_right!
			when "m"
				return boundary_alert unless move_forward!
			else
				return "Move '#{current_move}' is invalid!"
			end
			@orders[:position]
		rescue
			return "ALERT: NO MOVES REMAINING!"
		end
	end
	
	def move_count
		@moves.to_a.count
	end

	def move_forward!
		values = @compass.current_move
		return false if boundary?(values)
		@orders[:position][:x] += values[0]
		@orders[:position][:y] += values[1]
	end

	def boundary?(values)
	  boundary =   column_boundary?(values[0])
	  boundary ||= row_boundary?(values[1])
	end

	def column_boundary?(x_value)
		@orders[:position][:x] + x_value > @boundaries[:columns] ||  @orders[:position][:x] + x_value == -1
	end

	def row_boundary?(y_value)
		@orders[:position][:y] + y_value > @boundaries[:rows]    ||  @orders[:position][:y] + y_value == -1
	end

	def boundary_alert
		"ALERT: MOVE INVALID, PLATEAU BOUNDARY REACHED"
	end
end
