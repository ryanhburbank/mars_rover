Dir["./app/*.rb"].each { |file| require file }

if ARGV[0]
	mission = Mission.new(ARGV[0])
else
	mission = Mission.new("./lib/sample_input2.txt")
end

rover_positions = []

mission.rovers.each_value do |rover_order|
	rover = Rover.new(rover_order)
	rover.move_all!
	puts rover.position
end



