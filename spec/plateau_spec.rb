require 'spec_helper'

describe "Plateau" do
	let (:instruction) { Instruction.new("lib/sample_input.txt") }
	let (:plateau) { Plateau.new(instruction.dimensions) } 

	describe "#new" do
		context "takes a hash with a :rows keys and :columns key" do
			it "stores the :rows value in @rows" do
				plateau.rows.should eq 6
			end

			it "stores the :columns value in @columns" do
				plateau.columns.should eq 6
			end

			it "sets @grid to a nested array with the values from @rows and @columns" do
				plateau.grid.should eq [ ['X', 'X', 'X', 'X', 'X', 'X' ],
				                         ['X', 'X', 'X', 'X', 'X', 'X' ],
				                         ['X', 'X', 'X', 'X', 'X', 'X' ],
				                         ['X', 'X', 'X', 'X', 'X', 'X' ],
				                         ['X', 'X', 'X', 'X', 'X', 'X' ],
				                         ['X', 'X', 'X', 'X', 'X', 'X' ] ] 
			end
		end
	end
end