
class Plateau 
	attr_reader :rows, :columns, :grid

	def initialize(dimensions)
		@rows    = dimensions[:rows]
		@columns = dimensions[:columns]
		@grid    = generate_grid
	end

	def generate_grid
		grid = []
		(1..(rows * columns)).to_a.each_slice(columns) {|column| grid << column }
		grid
	end

	def grid_display
		display_grid = grid.reverse
		longest = 0 
		display_grid.each {|row| row.each {|e| longest = e.to_s.length if longest < e.to_s.length  }}
		display = ""
		display_grid.each do |row|
			row_string = ""
			row.each do |coord|
				formatted_coordinate =  " " * (longest - coord.to_s.length) + coord.to_s
				row_string << "|#{formatted_coordinate}|" 
			end
			display << row_string + "\n"
		end
		puts display
	end
end

foo = Plateau.new({rows: 10, columns: 12})
