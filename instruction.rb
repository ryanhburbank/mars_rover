require_relative './parser'

class Instruction 
	include Parser
	attr_reader :plateau_dimensions, :rovers
	
	def initialize(file)
		parsed_file = parse(file)
		@plateau_dimensions = get_dimensions(parsed_file)
		@rovers = get_rovers(parsed_file)
	end

	private

	def get_dimensions(file)
		formatted_array = file.shift.split(' ').map { |e| e.to_i }
		{ rows: formatted_array[0], columns: formatted_array[1] }
	end

	def get_rovers(file)
		formatted_hash = {}
		file.each_slice(2).with_index do |(position, moves), index|
			formatted_hash["rover#{index + 1}".to_sym] = { position: format_position(position), 
																										 moves:    moves.split('') }
		end
		formatted_hash
	end

	def format_position(position)
		formatted_array = position.split(' ')
		{ x: formatted_array[0].to_i, y: formatted_array[1].to_i, heading: formatted_array[2] } 
	end
end


