require 'spec_helper'

describe "Interface" do
	
	describe "self.run" do
		it "if ARGV, passes ARGV[0] to create a new mission" do
			ARGV[0] = "./lib/sample_input.txt"
			Interface.run.should eq ("{:x=>1, :y=>3, :heading=>\"n\"} \n{:x=>5, :y=>1, :heading=>\"e\"} \n")
		end

		it "if no ARGV, uses a sample_fil to create a new mission" do
			Interface.run.should eq ("{:x=>1, :y=>3, :heading=>\"n\"} \n{:x=>5, :y=>1, :heading=>\"e\"} \n") 
		end
	end
end