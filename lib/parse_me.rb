class ParseMe

	def initialize(log_file_name)
		#initializing variables
		check_if_file_exists(log_file_name)
		@log_file_name, @log_hash = log_file_name, Hash.new { |hash, key| hash[key] = [] }
	end

	def read_file_store_logs
		#reading file from path
		file = File.open(@log_file_name).each do |content|
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

	private

	def check_if_file_exists(log_file_name) 
		#checking if file exist
		raise "File #{log_file_name} doesnot exist" unless File.exist?(log_file_name) 
	end

	def get_sorted_hash_and_print_result(query = nil)
		#DRY used for unique and all values of array
		@sorted_hash = Hash.new
		@log_hash.each do |view_name, ip_addresses|
			@sorted_hash[view_name] = query ? ip_addresses.uniq.count : ip_addresses.count
		end
		print_result(query)
	end

	def print_result(query)
		#printing the output
		extra_text = query ? 'unique views' : 'views'
		@sorted_hash.each do |view_name, ip_addresses_count|
			puts "#{view_name} #{ip_addresses_count} #{extra_text}"
		end
	end

end