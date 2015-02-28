# **Change Return Program** - The user enters a cost and then the amount of money
# given. The program will figure out the change and the number of quarters,
# dimes, nickels, pennies needed for the change.

class ChangeReturn
	def self.get_user_input
		gets.chomp
	end

	def self.prompt_user(msg)
		puts msg
	end

	# returns a hash of each type of US coin and the amount of that coin
	def self.calculate_change(cost, amount_give)

	end

	def self.display_change(change_hash)
		puts "Your change is $#{ change_hash[:total] }:\n
					\t#{ change_hash[:dollars] } dollar#{ change_hash[:dollars] > 1 ? 's' : ''},\n
					\t#{ change_hash[:quarters] } quarter#{ change_hash[:quarters] > 1 ? 's' : ''},\n
					\t#{ change_hash[:dimes] } dime#{ change_hash[:dimes] > 1 ? 's' : ''},\n
					\t#{ change_hash[:nickels] } nickel#{ change_hash[:nickels] > 1 ? 's' : ''},\n
					\t#{ change_hash[:pennies] } penn#{ change_hash[:pennies] > 1 ? 'ies' : 'y'}"
	end

	def self.proper_pluralize(num_amount, word)
		if num_amount == 1
			return word
		else 
			return word.chop + 'ies' if (word[-1] == 'y')
			return word + 's'
		end
	end

	def self.check_input(input)
		raise "Bad user input" if input.nil?
	end

	def self.run
		prompt_user("Please input the cost:")
		cost = get_user_input.to_f

		prompt_user("Please input the total given:")
		amount_given = get_user_input.to_f

		display_change(calculate_change(cost, amount_given))
	end
end
