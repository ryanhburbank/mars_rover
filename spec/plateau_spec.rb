require 'spec_helper'

describe "Plateau" do

	describe "#new" do
		let (:plateau) { Plateau.new({ rows: 6, columns: 6 }) } 
		
		context "takes a hash with a :rows keys and :columns key" do
			
			it "and returns a Plateau object" do
				plateau.should be_an_instance_of Plateau 
			end
			
			it "stores the :rows value in @rows" do
				plateau.rows.should eq 6
			end

			it "stores the :columns value in @columns" do
				plateau.columns.should eq 6
			end

			it "sets @grid to a nested array with the values from @rows and @columns" do
				plateau.grid.should eq [ ['X', 'X', 'X', 'X', 'X', 'X' ],
				                         ['X', 'X', 'X', 'X', 'X', 'X' ],
				                         ['X', 'X', 'X', 'X', 'X', 'X' ],
				                         ['X', 'X', 'X', 'X', 'X', 'X' ],
				                         ['X', 'X', 'X', 'X', 'X', 'X' ],
				                         ['X', 'X', 'X', 'X', 'X', 'X' ] ] 
			end
		end
	end
end