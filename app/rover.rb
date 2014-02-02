require 'fiber'
# require_relative './direction'
require_relative './compass'

class Rover
	
	MOVE_VALUES  = { "n" => [0,1], "e" => [1,0], "s" => [0,-1], "w" => [-1,0] }
	DEFAULT_DIRECTIONS = [ "n", "e", "s", "w" ]
	
	def initialize(orders, directions = nil, direction_values = nil)
		@orders              = orders
		@moves               = orders[:moves].each
		@compass             = Compass.new(directions || DEFAULT_DIRECTIONS)	
		@compass.set_current_heading(@orders[:position][:heading])
	end

	def position
		@orders[:position]
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

	def move_all!
		move_count.times { move_once! }
		@orders[:position]
	end

	def moves_list
		"#{@moves.to_a.join(', ')}"
	end

	private
	
	def move_count
		@moves.to_a.count
	end

	def move_forward!
		values = MOVE_VALUES[@orders[:position][:heading]]
		return false if boundary?(values)
		@orders[:position][:x] += values[0]
		@orders[:position][:y] += values[1]
	end

	def boundary?(values)
	  boundary =   @orders[:position][:x] + values[0] > @orders[:boundaries][:columns] ||  @orders[:position][:x] + values[0] == -1  
	  boundary ||= @orders[:position][:y] + values[1] > @orders[:boundaries][:rows]    ||  @orders[:position][:y] + values[1] == -1
	end

	def boundary_alert
		"ALERT: MOVE INVALID, PLATEAU BOUNDARY REACHED"
	end
end
