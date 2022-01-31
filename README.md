Running the project:

1. Run this command "ruby ./parser.rb webserver.log" to check the output as per the file content.

Dependency:

1. There is no dependency. Ruby 2.6.3 and rspec gem is used to make this project. You may install and use any ruby using RVM.

Coding Approach

1. I have tried to make this as DRY and object-orieted as possible.

2. Comments are added to help with the functionality.

3. Various checks are added to see if file is present or blank.

4. Any file opened is closed too.

5. Hash is used to get the desired output and store the logs.

6. Array is used to store the different IP's in the collection as per the page visited.

7. Array sort_by with uniq was also tried, but it get failed when there is no duplicate IP and nil was returned by uniq! making the comparison fail.

	def print_sorted_most_views
		get_sorted_array_and_print_result
	end

	def print_sorted_unique_views
		get_sorted_array_and_print_result('.uniq!')
	end

	def get_sorted_array_and_print_result(query = '')
		@sorted_array = eval("@log_hash.sort_by { |view_name, ip_addresses| ip_addresses#{query}.to_a.count }.reverse")
		print_result(query)
	end

8. Code is tried to be kept simmple and clean as possible.
