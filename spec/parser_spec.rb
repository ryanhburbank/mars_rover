require 'spec_helper'

describe "Parser" do
	describe "#self.parse" do
		let (:correct_output) { ["5 5", "1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM"] }
		let (:Parser) { Parser }

		it "takes a .txt file and returns a properly formatted hash " do
			Parser.parse("sample_input.txt").should eq correct_output
		end

		it "takes a .csv file and returns an Array " do
			Parser.parse("sample_input.csv").should eq correct_output
		end

		it "takes a .yml file and returns an Array " do
			Parser.parse("sample_input.yml").should eq correct_output
		end

		context "the passed file is empty & the filetype is supported" do
			
			it "raises an error if it is a csv file" do
				lambda { Parser.parse("empty_input.csv") }.should raise_error(ArgumentError)
			end
			
			it "raises an error if it is a yml file" do
				lambda { Parser.parse("empty_input.yml") }.should raise_error(ArgumentError)
			end
			
			it "raises an error if it a txt file" do	
				lambda { Parser.parse("empty_input.txt") }.should raise_error(ArgumentError)
			end
		end

		context "the passed file's extension is unsupported" do
			
			it "raises an error if file has contents" do
				lambda { Parser.parse("empty_input.foo")}.should raise_error(ArgumentError)
			end

			it "raises an error if file is empty" do
				lambda { Parser.parse("sample_input.foo")}.should raise_error(ArgumentError)
			end
		end
	end
end