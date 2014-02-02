require_relative './parser'

class Mission 
	include Parser
	attr_reader :dimensions, :rovers
	
	def initialize(file)
		parsed_file         = parse(file)
		@dimensions         = extract_dimensions(parsed_file)
		@rovers             = extract_rovers(parsed_file)
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
			formatted_hash["rover#{index + 1}".to_sym] = { position: extract_position(position), 
																										 moves:    moves.downcase.split(''),
																										 boundaries:    @dimensions }
		end
		formatted_hash
	end

	def extract_position(position)
		formatted_array = position.split(' ')
		{ x: formatted_array[0].to_i, y: formatted_array[1].to_i, heading: formatted_array[2].downcase } 
	end
end


