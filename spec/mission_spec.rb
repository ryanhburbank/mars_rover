require 'spec_helper'

describe "Mission" do
	let(:mission) { Mission.new("lib/sample_input.txt") }

	describe "#new" do
		it "takes a file as a parameter an returns an mission object " do
			mission.should be_an_instance_of Mission
		end

		it "sets @dimensions" do
			mission.dimensions.should eq ({ rows: 6, columns: 6 })
		end

		it "sets @rovers" do
			mission.rovers.should eq ({ rover1: { position: { x: 1, y: 2, heading: "n" }, moves: ["l","m","l","m","l","m","l","m","m"],
																								boundaries: { columns: 6, rows: 6 } },
																		  rover2: { position: { x: 3, y: 3, heading: "e" }, moves: ["m","m","r","m","m","r","m","r","r","m"],
																		  					boundaries: { columns: 6, rows: 6 } }
																	 })
		end
	end
end
