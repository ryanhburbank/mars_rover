
class Rover
	attr_reader :orders
	HEADINGS = { n:[0,1], e: [1,0], s: [0,-1], w:[-1,0] }

	def initialize(orders)
		@orders = orders
	end
end