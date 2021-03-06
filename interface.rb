Dir["./app/*.rb"].each { |file| require file }

class Interface

	def self.run
			mission = Mission.new(ARGV[0]) if ARGV[0]
			mission ||= Mission.new("./lib/sample_input1.txt")
			plateau = make_plateau(mission.plateau_dimensions)
			rovers  = make_rovers(mission.rover_orders, plateau)
			move_rovers(rovers)
	end

	private

	def self.make_plateau(dimensions)
		Plateau.new(dimensions)
	end

	def self.make_rovers(rover_orders, plateau)
		rover_array = []
		rover_orders.each_value {|orders| rover_array << Rover.new(orders, plateau) }
		rover_array
	end

	def self.move_rovers(rovers)
		final_positions = ""
		rovers.each do |rover|
			rover.move_all!
			final_positions << "#{rover.position} \n"
		end
		puts final_positions
		final_positions
	end
end

Interface.run


