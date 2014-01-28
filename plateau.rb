
class Plateau 
	attr_reader :rows, :columns, :grid

	def initialize(dimensions)
		@rows    = dimensions[:rows]
		@columns = dimensions[:columns]
		@grid    = generate_grid
	end

	def generate_grid
		grid = []
		(1..(rows * columns)).to_a.each_slice(rows) {|row| grid << row }
		grid
	end
end