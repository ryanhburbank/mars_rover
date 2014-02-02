Dir["./app/*.rb"].each { |file| require file }

class Interface

	def self.run
			mission = Mission.new(ARGV[0]) if ARGV[0]
			mission ||= Mission.new("./lib/sample_input2.txt")
			move_rovers(mission.rovers)
	end

	private
	def self.move_rovers(rover_orders)
		final_positions = ""
		rover_orders.each_value do |orders|
			rover = Rover.new(orders)
			final_positions << "#{rover.move_all!} \n"
		end
		final_positions
	end
end

p Interface.run
