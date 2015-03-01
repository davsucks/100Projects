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
		raise 'Cannot convert negative decimal to binary' if decimal < 0
		raise 'Can only convert integer to binary' unless decimal.is_a? Integer
		calculate_binary_from_decimal(decimal)
	end

	def self.calculate_binary_from_decimal(decimal)
		ret_val = ""
		while decimal > 0
			ret_val.prepend(convert_to_string(decimal % 2))
			decimal = decimal / 2
		end
		ret_val.to_i
	end

	def self.convert_to_string(int)
		int.to_s
	end
end
