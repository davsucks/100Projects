# **Binary to Decimal and Back Converter**
# Develop a converter to convert a decimal number to binary or a
# binary number to its decimal equivalent.

class BinaryDecimal
	def self.binary_to_decimal(binary)
		calculate_decimal_from_binary(binary.to_s)
	end

	def self.calculate_decimal_from_binary(binary)
		sum = 0
		binary.chars.reverse.each_with_index do |bit, index|
			sum += 2**index if bit == '1'
		end
		sum
	end

	def self.decimal_to_binary(decimal)

	end
end