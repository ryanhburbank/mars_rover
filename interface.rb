require_relative './instruction'
require_relative './plateau'
require_relative './rover'

class Interface
	attr_reader :rovers, :plateau

	def initialize(file_path)
		instructions = Instruction.new(file_path)
		@plateau     = Plateau.new(instructions.dimensions)
		@rovers      = make_rovers(instructions.rovers)  
	end
	
	def display(plateau_grid)
			display_grid = plateau_grid.reverse
			display = ""
			display_grid.each do |row| 
				row_string = ""
				row.each { |element| row_string << "|#{element}|" }
				display <<  row_string + "\n"
			end
			puts display
	end

	private

	def make_rovers(rovers_hash)
		rovers_array = []
		rovers_hash.each_key {|rover| rovers_array << Rover.new(rovers_hash[rover]) }
		rovers_array
	end
end

