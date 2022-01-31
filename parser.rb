require_relative 'lib/parse_me'

log_parser = ParseMe.new(ARGV[0])
log_parser.read_file_store_logs
log_parser.print_sorted_most_views
puts "\n"
log_parser.print_sorted_unique_views