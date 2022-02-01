require_relative '../spec_helper'
require_relative '../../lib/file_validator'

RSpec.describe 'path name input' do

	before(:all) do
		@log_file_name = 'test_webserver.log'
  end


  describe 'given argument as file name' do
		it 'is expected to be present' do
			expect{FileValidator.check_for_argument_given(nil)}.to raise_error(RuntimeError, "Please pass file name as an argument")
		end
	end

	describe 'initialized with wrong path' do
		it 'is expected to raise error if path doesnot exist' do
			wrong_log_file_name = 'wrong_webserver.log'
			expect{FileValidator.check_if_file_exists(wrong_log_file_name)}.to raise_error(RuntimeError, "File at #{wrong_log_file_name} doesnot exist")
		end
	end

end
