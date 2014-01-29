class Interface


	def self.display(plateau_grid)
			display_grid = plateau_grid.reverse
			display = ""
			display_grid.each do |row| 
				row_string = ""
				row.each { |element| row_string << "|#{element}|" }
				display <<  row_string + "\n"
			end
			puts display
	end
end