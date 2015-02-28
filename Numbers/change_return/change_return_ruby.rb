# **Change Return Program** - The user enters a cost and then the amount of money
# given. The program will figure out the change and the number of quarters,
# dimes, nickels, pennies needed for the change.

class ChangeReturn
	def self.get_user_input
		gets.chomp
	end

	def self.run
		cost = get_user_input
		amount_given = get_user_input
	end
end