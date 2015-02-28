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

	describe '.prompt_user' do
		it 'outputs the message passed in' do
			expect(ChangeReturn).to receive(:puts).with("user_input")
			ChangeReturn.prompt_user("user_input")
		end
	end

	describe '.run' do
		it 'returns .calculate_change' do
			expect(ChangeReturn).to receive(:calculate_change).and_return( {} )
			expect(ChangeReturn).to receive(:prompt_user).twice
			expect(ChangeReturn).to receive(:display_change).and_return("ret")
			expect(ChangeReturn.run).to eq("ret")
		end
	end

	describe '.check_input' do
		context 'when given incorrect input' do
			it 'raises an exception' do
				expect{ ChangeReturn.check_input(nil) }.to raise_error("Bad user input")
			end
		end

		context 'when given correct input' do
			it 'does nothing' do
				expect{ ChangeReturn.check_input(12.43) }.to_not raise_error
			end
		end
	end

	describe '.proper_pluralize' do
		context 'when passing in one item' do
			it 'returns the original word' do
				expect(ChangeReturn.proper_pluralize(1, 'penny')).to eq('penny')
			end
		end

		context 'when passing in more than one item' do
			context 'when the word does not end in y' do
				it 'adds "s" to the original word' do
					expect(ChangeReturn.proper_pluralize(2, 'quarter')).to eq('quarters')
				end
			end

			context 'when the word ends in "y"' do
				it 'replaces "y" with "ies"' do
					expect(ChangeReturn.proper_pluralize(2, 'penny')).to eq('pennies')
				end
			end
		end
	end

	describe '.display_change' do
		it 'returns a nicely displayed hash' do
			change_hash = {
				total: 5.41,
				dollars: 5,
				quarters: 1,
				dimes: 1,
				nickels: 1,
				pennies: 1
			}
		end
	end

	describe '.calculate_change' do
		context 'when the cost is 5 dollars' do
			context 'when given 5 dollars' do
				it 'returns no change' do
					expect(ChangeReturn.calculate_change(5, 5)).to eq(0)
				end
			end
		end
	end
end
