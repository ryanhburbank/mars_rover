require_relative './parser'

class Mission 
	include Parser
	attr_reader :plateau_dimensions
	
	def initialize(file_or_array)
	  array_of_orders       = file_or_array if file_or_array.class == Array
		array_of_orders       ||= parse(file_or_array)
		@plateau_dimensions   = extract_dimensions(array_of_orders)
		@rover_orders         = extract_rovers(array_of_orders)
	end

	def send_rover_orders
		@rover_orders
	end

	private

	def extract_dimensions(array_of_orders)
		dimension_string = array_of_orders.shift
		dimension_array  = dimension_string.split(' ').map { |e| e.to_i }
		{ columns: dimension_array[0] + 1, rows: dimension_array[1] + 1 }
	end

	def extract_rovers(array_of_rover_data)
		formatted_hash = {}
		array_of_rover_data.each_slice(2).with_index do |(position, moves), index|
			formatted_hash["rover#{index + 1}".to_sym] = { position:   extract_position(position), 
																										 moves:      moves.downcase.split('') }
		end
		formatted_hash
	end

	def extract_position(position)
		formatted_array = position.split(' ')
		{ x: formatted_array[0].to_i, y: formatted_array[1].to_i, heading: formatted_array[2].downcase } 
	end
end



