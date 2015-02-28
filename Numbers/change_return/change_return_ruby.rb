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
	def self.calculate_change(cost, amount_given)
		raise "Not enough money" if cost > amount_given
		assign_change_hash(cost, amount_given)
	end

	def self.assign_change_hash(cost, amount_given)
		change_hash = {}
		change_hash[:total] = (amount_given - cost).round(2)
		change_hash[:dollars] = truncate(amount_given - cost)

		assign_coins(change_hash, determine_change(change_hash[:total], 1))
	end

	def self.assign_coins(change_hash, change)
		%i(quarters dimes nickels pennies).zip([QUARTER_C, DIME_C, NICKEL_C, PENNY_C]).each do |index, value|
			change_hash[index] = truncate(change / value)
			change = determine_change(change, value)
		end

		change_hash
	end

	def self.determine_change(remainder, denominator)
		(remainder % denominator).round(2)
	end

	def self.truncate(decimal)
		decimal.to_i
	end

	def self.display_change(change_hash)
		puts "Your change is $#{ change_hash[:total] }:\n
					\t#{ change_hash[:dollars] } #{ proper_pluralize(change_hash[:dollars], 'dollar') },\n
					\t#{ change_hash[:quarters] } #{ proper_pluralize(change_hash[:quarters], 'quarter') },\n
					\t#{ change_hash[:dimes] } #{ proper_pluralize(change_hash[:dimes], 'dime') },\n
					\t#{ change_hash[:nickels] } #{ proper_pluralize(change_hash[:nickels], 'nickel') },\n
					\t#{ change_hash[:pennies] } #{ proper_pluralize(change_hash[:pennies], 'penny') }"
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
		cost = check_input(get_user_input.to_f)

		prompt_user("Please input the total given:")
		amount_given = check_input(get_user_input.to_f)

		display_change(calculate_change(cost, amount_given))
	end

private
	QUARTER_C = 0.25
	DIME_C = 0.1
	NICKEL_C = 0.05
	PENNY_C = 0.01
end
