require 'fiber'

class Rover
	attr_reader :position, :current_heading
	MOVE_VALUES  = { "n" => [0,1], "e" => [1,0], "s" => [0,-1], "w" => [-1,0] }
	DIRECTIONS = [ "n", "e", "s", "w" ]
	def initialize(orders)
		@position            = orders[:position]
		@moves               = orders[:moves].each
		@fiber               = set_fiber
		@position[:heading]  = @fiber.resume
	end

	def move_once!
		begin
			current_move = @moves.next
			self.send(current_move)
			@position
		rescue
			return "ALERT: NO MOVES REMAINING!"
		end
	end

	def move_all!
		moves.length.times { move_once! }
		@position
	end

	def moves
		@moves.to_a
	end

	private
	def l
		2.times { |int| @fiber.resume }
		@position[:heading] = @fiber.resume
	end

	def r
		@position[:heading] = @fiber.resume
	end

	def m
		values = MOVE_VALUES[@position[:heading]]
		@position[:x] += values[0]
		@position[:y] += values[1]
	end

	def set_fiber
		Fiber.new do 
			iterator = DIRECTIONS.cycle
			DIRECTIONS.index(@position[:heading]).times {|int| iterator.next }
			while iterator
				Fiber.yield iterator.next
			end
		end
	end
end