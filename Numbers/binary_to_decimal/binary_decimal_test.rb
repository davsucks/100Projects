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
end