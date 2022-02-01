require_relative 'file_validator.rb'

class ParseFile

	def initialize(log_file_path)
		#Validating file
		FileValidator.validate_log_file(log_file_path)
		#initializing variables
		@log_file_path, @log_hash = log_file_path, Hash.new { |hash, key| hash[key] = [] }
	end

	def read_file_store_logs
		#reading file from path
		file = File.open(@log_file_path).each do |content|
      view_name, ip_address = content.split(' ')
      @log_hash[view_name] << ip_address
    end
    file.close() #closing the file
    raise "File seems to be blank" if @log_hash.empty? #checking if file is blank
    @log_hash
	end

	def print_sorted_most_views
		#getting desired hash for output
		get_sorted_hash_and_print_result
	end

	def print_sorted_unique_views
		#getting desired hash for output
		get_sorted_hash_and_print_result(true)
	end

	def print_result(query = nil)
		#printing the output
		extra_text = query ? 'unique views' : 'total views'
		puts '----------------------------------------------'
		puts 'ADDRESS'.ljust(21) + "#{extra_text.upcase}"
		@sorted_hash.each do |view_name, ip_addresses_count|
			puts "#{view_name.ljust(20)} #{ip_addresses_count} #{extra_text}"
		end
		puts '----------------------------------------------'
	end

	private

	def get_sorted_hash_and_print_result(query = nil)
		#DRY used for unique and all values of array
		@sorted_hash = Hash.new
		@log_hash.each do |view_name, ip_addresses|
			@sorted_hash[view_name] = query ? ip_addresses.uniq.count : ip_addresses.count
		end
		@sorted_hash
	end

end