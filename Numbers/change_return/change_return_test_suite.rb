require_relative 'change_return_ruby'

RSpec.describe ChangeReturn do
	describe '.get_user_input' do
		before(:each) do
			expect(ChangeReturn).to receive(:gets).and_return("user_input\n")
		end

		it 'returns the user_input' do
			expect(ChangeReturn.get_user_input).to eq("user_input")
		end
	end

	describe '.run' do
		it 'returns something' do

		end
	end
end