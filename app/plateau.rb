class Plateau 

	def initialize(dimensions)
		@rows    = dimensions[:rows]
		@columns = dimensions[:columns]
	end

	def dimensions
		{ columns: @columns, rows: @rows }
	end
end



