require_relative 'binary_decimal_converter'

RSpec.describe BinaryDecimal do
	describe '.calculate_decimal_from_binary' do
		context 'when given 101101101' do
			it 'outputs 365' do
				expect(BinaryDecimal.calculate_decimal_from_binary('101101101')).to eq(365)
			end
		end

		context 'when given 1' do
			it 'outputs 1' do
				expect(BinaryDecimal.calculate_decimal_from_binary('1')).to eq(1)
			end
		end

		context 'when given 100000000000000011010101' do
			it 'outputs 8388821' do
				expect(BinaryDecimal.calculate_decimal_from_binary('100000000000000011010101')).to eq(8388821)
			end
		end
	end

	describe '.binary_to_decimal' do
		it 'calls calculate_decimal_from_binary' do
			expect(BinaryDecimal).to receive(:calculate_decimal_from_binary)
			BinaryDecimal.binary_to_decimal(1)
		end
	end

	describe '.decimal_to_binary' do
		it 'calls calculate_binary_from_decimal' do
			expect(BinaryDecimal).to receive(:calculate_binary_from_decimal)
			BinaryDecimal.decimal_to_binary(489287)
		end
	end

	describe '.calculate_binary_from_decimal' do
		context 'when given 1' do
			it 'returns 1' do
				expect(BinaryDecimal.decimal_to_binary(1)).to eq(1)
			end
		end

		context 'when given 12' do
			it 'returns 1100' do
				expect(BinaryDecimal.decimal_to_binary(12)).to eq(1100)
			end
		end

		context 'when given 4319847' do
			it 'returns 10000011110101001100111' do
				expect(BinaryDecimal.decimal_to_binary(4319847)).to eq(10000011110101001100111)
			end
		end
	end
end