require 'spec_helper'

describe "Interface" do
	let (:interface) { Interface.new("lib/sample_input.txt") }

	describe "#new" do
		it "takes a txt,csv or yml file and returns an iterface object" do
			interface.should be_instance_of Interface
		end

		it "sets @plateau to a Plateau object" do
			interface.plateau.should be_instance_of Plateau
		end

		it "sets @rovers to a hash a rovers" do
			interface.rovers[0].should be_instance_of Rover
			interface.rovers[1].should be_instance_of Rover
		end
	end
end