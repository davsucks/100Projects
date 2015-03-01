# **Mortgage Calculator** - Calculate the monthly payments of a fixed
# term mortgage over given Nth terms at a given interest rate. Also figure
# out how long it will take the user to pay back the loan. For added 
# complexity, add an option for users to select the compounding interval
# (Monthly, Weekly, Daily, Continually).

print "Please input the number of years: "
terms = gets.chomp.to_i

print "Please input the interest rate: %"
interest_rate = gets.chomp.to_f

print "Please input the amount of the mortgage: $"
amount = gets.chomp.to_f

print "Would you like to add a compounding interval? "
response = gets.chomp.lstrip.downcase[0]

case response
when "y"
	puts "yes!"
when "n"
	puts "no!"
else
	puts "I dont know what you said!"
end

monthly_payment = (amount + (amount * interest_rate/100)) / terms
puts "Your monthly payment is $#{monthly_payment}"