require 'spec_helper'

describe "Instruction" do
	let(:instruction) { Instruction.new("lib/sample_input.txt") }
	let (:parsed_format) { ["5 5", "1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM"] }

	describe "#new" do
		it "takes a file as a parameter an returns an Instruction object " do
			instruction.should be_an_instance_of Instruction
		end

		it "sets @plateau_dimensions" do
			instruction.plateau_dimensions.should eq ({ rows: 5, columns: 5 })
		end

		it "sets @rovers" do
			instruction.rovers.should eq ({ rover1: { position: { x: 1, y: 2, heading: "N" }, moves: ["L","M","L","M","L","M","L","M","M"] },
																		  rover2: { position: { x: 3, y: 3, heading: "E" }, moves: ["M","M","R","M","M","R","M","R","R","M"] }
																	 })
		end
	end
end