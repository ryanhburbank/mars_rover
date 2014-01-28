require 'spec_helper'

describe "Parser" do
	describe "#self.parse" do
		it "takes a .txt file and returns an Array " do
			pending
		end

		it "takes a .csv file and returns an Array " do
			pending
		end

		it "takes a .yml file and returns an Array " do
			pending
		end

		it "raises an error if the passed file is empty" do
			Parser.parse("empty_file_csv.csv").should eq []
			Parse.parse("empty_file_yaml.yml").should eq []
			Parse.parse("empty_file_txt.txt").should eq []
		end
	end
end