class FileValidator

	def self.validate_log_file(log_file_path)
		check_for_argument_given(log_file_path)
		check_if_file_exists(log_file_path)
	end

	def self.check_for_argument_given(log_file_path)
		#checking if argument given
		raise "Please pass file name as an argument" if log_file_path.nil?
	end

	def self.check_if_file_exists(log_file_path)
		#checking if file exist
		raise "File at #{log_file_path} doesnot exist" unless File.exist?(log_file_path)
	end

end