require 'spec_helper'

describe "Rover" do 
	let (:instructions) { Instruction.new("lib/sample_input.txt") }
	let (:rover) { Rover.new(instructions.rovers[:rover1]) }
	
	describe "#new" do
		
		it "takes a hash and returns a Rover object" do
			rover.should be_an_instance_of Rover
		end

		it "sets @position to the hash's :position key" do
			rover.position.should eq ({ x: 1, y: 2, heading: "n"})
		end

		it "sets @moves to the hash's :moves key" do
			rover.moves.should eq (["l","m","l","m","l","m","l","m","m"])
		end
	end

	describe "#move!" do
		context "there are elements remaining in the moves array" do
			it "updates the rover's position or heading by one move" do
				rover.position.should eq ({ x: 1, y: 2, heading: "n" })
				rover.move!
				rover.position.should eq ({ x: 1, y: 2, heading: "w" })
			end
		end
		context "there are no elements remaining in the moves array" do
			it "returns 'ALERT: NO MOVES REMAINING!' when called" do
				rover.moves.count.times {|x| rover.move! }
				rover.move!.should eq "ALERT: NO MOVES REMAINING!"
			end 
		end
	end
end