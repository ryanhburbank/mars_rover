require 'spec_helper'

describe "Rover" do 
	let (:rover1) { Rover.new({ position: { x: 1, y: 2, heading: "n" }, 
															moves: ["l","m","l","m","l","m","l","m","m"],
															boundaries: { columns: 6, rows: 6 } }) }
	let (:rover2) { Rover.new({ position: { x: 3, y: 3, heading: "e" }, 
															moves: ["m","m","r","m","m","r","m","r","r","m"],
															boundaries: { columns: 6, rows: 6 } })}
	
	describe "#new" do
		
		it "takes a hash and returns a Rover object" do
			rover1.should be_an_instance_of Rover
		end

		it "sets @position to the hash's :position key" do
			rover1.position.should eq ({ x: 1, y: 2, heading: "n"})
		end

		it "sets @moves to the hash's :moves key" do
			rover1.moves.should eq (["l","m","l","m","l","m","l","m","m"])
		end
	end
  
	describe "#move_once!" do
		context "there are elements remaining in the moves array" do
			it "updates the rover's position or heading by one move" do
				rover1.position.should eq ({ x: 1, y: 2, heading: "n" })
				rover1.move_once!
				rover1.position.should eq ({ x: 1, y: 2, heading: "w" })
			end
		end
		context "there are no elements remaining in the moves array" do
			it "returns 'ALERT: NO MOVES REMAINING!' when called" do
				rover1.moves.count.times {|x| rover1.move_once! }
				rover1.move_once!.should eq "ALERT: NO MOVES REMAINING!"
			end 
		end

		context "the rover's next move would put it over the plateau's boundary" do
			let (:edge_rover) { Rover.new( { position: { x: 0, y: 0, heading: "s" }, moves: ["m"], boundaries: { columns: 1, rows: 1 } }) }
			it "returns 'ALERT: MOVE INVALID, PLATEAU BOUNDARY REACHED'" do
				edge_rover.move_once!.should eq "ALERT: MOVE INVALID, PLATEAU BOUNDARY REACHED"
				edge_rover.position.should eq ({ x: 0, y: 0, heading: "s" })
			end
		end
	end

	describe "#move_all!" do
		it "updates the rover to its final position by executing all moves" do
			rover1.move_all!.should eq ({ x: 1, y: 3, heading: "n" })
			rover2.move_all!.should eq ({ x: 5, y: 1, heading: "e" })
		end
	end
end
