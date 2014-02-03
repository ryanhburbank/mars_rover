require 'csv'
require 'yaml'

module Parser
	
	SUPPORTED_FORMATS = [".txt",".csv",".yml"]
	
	private

	def parse(file)
		ext_error(file) unless SUPPORTED_FORMATS.include? File.extname(file)
		send("parse_" + File.extname(file)[1..-1], file)
	end

	def ext_error(file)
		raise ArgumentError, "Error: '#{File.extname(file)}' extension is not supported!"
	end

	def empty_error(file)
		raise ArgumentError, "Error: '#{file}' is empty!"
	end

	def parse_csv(file)
		output = []
		CSV.foreach(file) { |row| output << row[0] }
		final_output(output, file)
	end

	def parse_txt(file)
		txt_file = File.open(file,"r")
		output   = txt_file.readlines
		txt_file.close
		final_output(output, file)
	end

	def parse_yml(file)
		output = YAML.load_file(file) || []
		final_output(output, file)
	end

	def final_output(output, file_path)
		output.reject!(&:nil?)
		output.map! {|e| e.sub("\n","")}
		output.empty? ? empty_error(file_path) : output.reject(&:empty?)
	end
end

