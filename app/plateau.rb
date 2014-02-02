

class Plateau 
	attr_reader :rows, :columns
	attr_accessor :grid

	def initialize(dimensions)
		@rows    = dimensions[:rows]
		@columns = dimensions[:columns]
		@grid    = generate_grid
	end

	def generate_grid
		grid = []
		((['X'] * rows) * columns).each_slice(columns) {|column| grid << column }
		grid
	end
end



