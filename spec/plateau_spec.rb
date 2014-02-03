require 'spec_helper'

describe "Plateau" do

	describe "#new" do
		let (:plateau) { Plateau.new({ rows: 5, columns: 6 }) } 
		
		context "takes a hash with a :rows keys and :columns key" do
			
			it "and returns a Plateau object" do
				plateau.should be_an_instance_of Plateau 
			end
			
			it "stores the :rows value in @rows" do
				plateau.dimensions[:rows].should eq 5
			end

			it "stores the :columns value in @columns" do
				plateau.dimensions[:columns].should eq 6
			end
		end
	end
end