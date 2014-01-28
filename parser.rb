require 'csv'
require 'yaml'

class Parser
	
	SUPPORTED_FORMATS = [".txt",".csv",".yml"]
	
	def self.parse(file)
		self.ext_error(file) unless SUPPORTED_FORMATS.include? File.extname(file)
		self.send("parse_" + File.extname(file)[1..-1], file)
	end

	private

	def self.ext_error(file)
		raise ArgumentError, "Error: #{file} extension is not supported!"
	end

	def self.empty_error(file)
		raise ArgumentError, "Error: #{file} is empty!"
	end

	def self.parse_csv(file)
		output = []
		CSV.foreach(file) { |row| output << row[0] }
		output.empty? ? empty_error(file) : output
	end

	def self.parse_txt(file)
		txt_file = File.open(file,"r")
		output = txt_file.readlines
		txt_file.close
		output.empty? ? empty_error(file) : output.map {|e| e.sub("\n","")}
	end

	def self.parse_yml(file)
		output = YAML.load_file(file) || []
		output.empty? ? self.empty_error(file) : output
	end
end

