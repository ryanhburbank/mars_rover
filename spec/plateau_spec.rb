require 'spec_helper'

describe "Plateau" do
	let (:instruction) { Instruction.new("lib/sample_input.txt") }
	let (:plateau) { Plateau.new(instruction.plateau_dimensions) } 

	describe "#new" do
		context "takes a hash with a :rows keys and :columns key" do
			it "stores the :rows value in @rows" do
				plateau.rows.should eq 5
			end

			it "stores the :columns value in @columns" do
				plateau.columns.should eq 5
			end

			it "sets @grid to a nested array with the values from @rows and @columns" do
				plateau.grid.should eq [ [1, 2, 3, 4, 5 ],
				                         [6, 7, 8, 9, 10],
				                         [11,12,13,14,15],
				                         [16,17,18,19,20],
				                         [21,22,23,24,25] ] 
			end
		end
	end
end