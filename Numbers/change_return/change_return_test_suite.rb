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

	describe '.calculate_change' do
		it 'returns assign_change_hash' do
			expect(ChangeReturn).to receive(:assign_change_hash).and_return('ret')
			expect(ChangeReturn.calculate_change(2, 3)).to eq('ret')
		end

		context 'when not given enough money' do
			it 'raises an error' do
				expect{ ChangeReturn.calculate_change(3, 2) }.to raise_error("Not enough money")
			end
		end
	end

	describe '.assign_change_hash' do
		context 'when the cost is 5 dollars' do
			context 'when given 5 dollars' do
				it 'returns no change' do
					expect(ChangeReturn.calculate_change(5, 5)).to eq({
						total: 0,
						dollars: 0,
						quarters: 0,
						dimes: 0,
						nickels: 0,
						pennies: 0
						})
				end
			end

			context 'when given 6.41' do
				it 'returns a hash that contains one of each denomination' do
					expect(ChangeReturn.calculate_change(5, 6.41)).to eq({
						total: 1.41,
						dollars: 1,
						quarters: 1,
						dimes: 1,
						nickels: 1,
						pennies: 1
						})
				end
			end
		end

		context 'when the total is 3.73' do
			context 'when given 4.09' do
				it 'returns a hash for $0.36' do
					expect(ChangeReturn.calculate_change(3.73, 4.09)).to eq({
						total: 0.36,
						dollars: 0,
						quarters: 1,
						dimes: 1,
						nickels: 0,
						pennies: 1
						})
				end
			end

			context 'when given 6.69' do
				it 'returns a hash for $2.96' do
					expect(ChangeReturn.calculate_change(3.73, 6.69)).to eq({
						total: 2.96,
						dollars: 2,
						quarters: 3,
						dimes: 2,
						nickels: 0,
						pennies: 1
					})
				end
			end
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
			expect(ChangeReturn).to receive(:puts)
			expect(ChangeReturn).to receive(:proper_pluralize).exactly(5).times
			ChangeReturn.display_change({})
		end
	end

	
end
