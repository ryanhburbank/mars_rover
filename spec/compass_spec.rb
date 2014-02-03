require 'spec_helper'

describe "Compass" do
	let (:compass) { Compass.new({ "n" => [0,1], "e" => [1,0], "s" => [0,-1], "w" => [-1,0] })}
	let (:compass2) { Compass.new({"n" => [0,1], "ne" => [1,1],"e" => [1,0], "se" => [1,-1],
																 "s" => [0,-1], "sw" => [-1,-1], "w" => [-1,0], "nw" => [-1,1]})}
	describe "#new" do
		it "takes a hash of directions and returns an instance of compass" do
			compass.should be_an_instance_of Compass
			compass2.should be_an_instance_of Compass
		end
	end

	describe "methods for turning" do
		before :each do 
			compass.set_current_heading("n")
			compass2.set_current_heading("ne")
		end
		describe "#set_current_heading" do
			it "takes a direction and sets the compass to that direction" do
				compass.current_direction.should eq "n"
				compass2.current_direction.should eq "ne"
			end
		end

		describe "#turn_right!" do
			it "iterates to the next key in the hash" do
				compass.turn_right!
				compass2.turn_right!
				compass.current_direction.should eq "e"
				compass2.current_direction.should eq "e"
			end
		end

		describe "turn_left!" do
			it "iterates the the previous key in the hash" do
				compass.turn_left!
				compass2.turn_left!
				compass.current_direction.should eq "w"
				compass2.current_direction.should eq "n"
			end
		end

		describe "#current_move" do
			it "returns the value from the current key" do
				compass.current_move.should eq ([0,1])
				compass2.current_move.should eq ([1,1])
			end
		end
	end
end 