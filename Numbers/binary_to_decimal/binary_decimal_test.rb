require_relative 'binary_decimal_converter'

RSpec.describe BinaryDecimal do
	describe '.binary_to_decimal' do
		context 'when given 101101101' do
			it 'outputs 365' do
				expect(BinaryDecimal.binary_to_decimal(101101101)).to eq(365)
			end
		end

		context 'when given 1' do
			it 'outputs 1' do
				expect(BinaryDecimal.binary_to_decimal(1)).to eq(1)
			end
		end

		context 'when given 100000000000000011010101' do
			it 'outputs 8388821' do
				expect(BinaryDecimal.binary_to_decimal(100000000000000011010101)).to eq(8388821)
			end
		end
	end
end