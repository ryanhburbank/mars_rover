require 'spec_helper'

describe "Compass" do
	let (:compass) { Compass.new({ "n" => [0,1], "e" => [1,0], "s" => [0,-1], "w" => [-1,0] })}
	describe "#new" do
		it "takes a hash of directions and returns an instance of compass" do
			compass.should be_an_instance_of Compass
		end
	end

	describe "#set_current_heading" do
		it "takes a direction and sets the compass to that direction" do
			compass.set_current_heading("n")
			compass.current_direction.should eq "n"
		end
	end

	describe "#turn_right!" do
		it "iterates to the next key in the hash" do
			compass.set_current_heading("n")
			compass.turn_right!
			compass.current_direction.should eq "e"
		end
	end

	describe "turn_left!" do
		it "iterates the the previous key in the hash" do
			compass.set_current_heading("n")
			compass.turn_left!
			compass.current_direction.should eq "w"
		end
	end

	describe "#current_move" do
		it "returns the value from the current key" do
			compass.set_current_heading("n")
			compass.current_move.should eq ([0,1])
		end
	end
end 