require 'spec_helper'

class Placeholder
 include Parser

  def private_parse(file)
 		parse(file)
 	end
end

describe "Parser" do
	describe "#self.parse" do
		let (:correct_output) { ["5 5", "1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM"] }
		let (:placeholder) { Placeholder.new }

		it "takes a .txt file and returns a properly formatted hash " do
			placeholder.private_parse("lib/sample_input1.txt").should eq correct_output
		end

		it "takes a .csv file and returns an Array " do
			placeholder.private_parse("lib/sample_input1.csv").should eq correct_output
		end

		it "takes a .yml file and returns an Array " do
			placeholder.private_parse("lib/sample_input1.yml").should eq correct_output
		end

		context "the passed file is empty & the filetype is supported" do
			
			it "raises an error if it is a csv file" do
				lambda { placeholder.private_parse("lib/empty_input1.csv") }.should raise_error(ArgumentError)
			end
			
			it "raises an error if it is a yml file" do
				lambda { placeholder.private_parse("lib/empty_input1.yml") }.should raise_error(ArgumentError)
			end
			
			it "raises an error if it a txt file" do	
				lambda { placeholder.private_parse("lib/empty_input1.txt") }.should raise_error(ArgumentError)
			end
		end

		context "the passed file's extension is unsupported" do
			
			it "raises an error if file has contents" do
				lambda { placeholder.private_parse("lib/empty_input1.foo")}.should raise_error(ArgumentError)
			end

			it "raises an error if file is empty" do
				lambda { placeholder.private_parse("lib/sample_input1.foo")}.should raise_error(ArgumentError)
			end
		end
	end
end