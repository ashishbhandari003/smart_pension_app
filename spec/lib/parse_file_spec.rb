require_relative '../spec_helper'
require_relative '../../lib/parse_file'

RSpec.describe 'ParseFile' do

	before(:all) do
		@parser = ParseFile.new('test_webserver.log')
    @file = File.open('test_webserver.log')
  end

  after(:all) do
    @file.close
  end

	describe 'reading the path' do
		it 'is expected to be a file' do
			expect(@file).to be_a File
		end
	end

	describe 'stored logs from reading file' do

		it 'is expected to raise error if file is blank' do
			expect{ParseFile.new('empty_webserver.log').read_file_store_logs}.to raise_error(RuntimeError, "File seems to be blank")
		end

		it 'is expected to be stored in hash' do
			expect(ParseFile.new('test_webserver.log').read_file_store_logs).to be_instance_of Hash
		end

		it 'is expected to return correct' do
			log_hash = {
				"/home"=>["682.704.613.213", "722.247.931.582", "316.433.849.805", "158.577.775.616", "451.106.204.921"],
				"/about/2"=>["715.156.286.412", "316.433.849.805", "897.280.786.156", "682.704.613.213", "555.576.836.194", "722.247.931.582", "897.280.786.156", "184.123.665.067", "646.865.545.408"],
				"/help_page/1"=>["897.280.786.156", "722.247.931.582", "382.335.626.855", "316.433.849.805", "682.704.613.213", "646.865.545.408", "802.683.925.780", "722.247.931.582", "715.156.286.412", "802.683.925.780"],
				"/about"=>["158.577.775.616", "061.945.150.735", "336.284.013.698", "682.704.613.213", "722.247.931.582", "897.280.786.156"],
				"/contact"=>["382.335.626.855", "158.577.775.616", "897.280.786.156", "316.433.849.805"],
				"/index"=>["451.106.204.921", "543.910.244.929", "158.577.775.616", "444.701.448.104", "543.910.244.929", "126.318.035.038", "184.123.665.067", "016.464.657.359", "897.280.786.156"]
			}
			expect(@parser.read_file_store_logs).to eq(log_hash)
		end
	end

	describe 'sorting most views' do
		it 'is expected to return correct' do
			sorted_hash = {"/home"=>5, 
				"/about/2"=>9, 
				"/help_page/1"=>10, 
				"/about"=>6, 
				"/contact"=>4, 
				"/index"=>9
			}
			expect(@parser.print_sorted_most_views).to eq(sorted_hash)
		end
	end

	describe 'sorting unique views' do
		it 'is expected to return correct' do
			sorted_hash = {
				"/home"=>5, 
				"/about/2"=>8, 
				"/help_page/1"=>8, 
				"/about"=>6, 
				"/contact"=>4, 
				"/index"=>8
			}
			expect(@parser.print_sorted_unique_views).to eq(sorted_hash)
		end
	end

end
