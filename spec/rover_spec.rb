require 'spec_helper'

describe "Rover" do 
	describe "#new" do
		let (:instructions) { Instruction.new("lib/sample_input.txt") }
		let (:rover) { Rover.new(instructions.rovers[:rover1]) }
		
		it "takes a hash and returns a Rover object" do
			rover.should be_an_instance_of Rover
		end

		it "sets @orders to the hash's value" do
			rover.orders.should eq ({ position: { x: 1, y: 2, heading: "N" }, 
															 moves: ["l","m","l","m","l","m","l","m","m"] })
		end
	end
end