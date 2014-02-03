require 'spec_helper'

describe "Mission" do
	let(:mission1) { Mission.new("lib/sample_input1.txt") }
	let(:mission2) { Mission.new(["3 2", "0 1 E", "LMMRM"])}

	describe "#new" do
		it "takes a file as a parameter an returns an mission object " do
			mission1.should be_an_instance_of Mission
			mission2.should be_an_instance_of Mission
		end

		it "sets @dimensions" do
			mission1.plateau_dimensions.should eq ({ columns: 6, rows: 6 })
			mission2.plateau_dimensions.should eq ({ columns: 4, rows: 3 })
		end

		it "sets @rovers" do
			mission1.rover_orders.should eq ({ rover1: { position: { x: 1, y: 2, heading: "n" }, moves: ["l","m","l","m","l","m","l","m","m"]},
																		  rover2: { position: { x: 3, y: 3, heading: "e" }, moves: ["m","m","r","m","m","r","m","r","r","m"]}
																	 })
			mission2.rover_orders.should eq ({ rover1: { position: { x: 0, y: 1, heading: "e" }, moves: ["l","m","m","r","m"]}})
		end
	end
end

