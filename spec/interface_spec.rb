require 'spec_helper'

describe "Interface" do
	
	describe "self.run" do
		it "if ARGV, passes ARGV[0] to create a new mission" do
			ARGV[0] = "./lib/sample_input2.txt"
			Interface.run.should eq ("{:x=>2, :y=>2, :heading=>\"s\"} \n")
		end

		it "if no ARGV, uses a sample_file to create a new mission" do
			ARGV[0] = nil
			Interface.run.should eq ("{:x=>1, :y=>3, :heading=>\"n\"} \n{:x=>5, :y=>1, :heading=>\"e\"} \n") 
		end
	end
end