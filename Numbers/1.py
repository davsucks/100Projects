# Find Pi to the Nth Digit
# ========================
# Enter a number and have the program generate PI
# up to that many decimal places.
# Keep a limit to how far the program will go.

pi = "3.141592653589793238462643383279502884197 \
		16939937510582097494459230781640628620899\
		86280348253421170679821480865132823066470\
		93844609550582231725359408128481117450284\
		10270193852110555964462294895493038196442\
		88109756659334461284756482337867831652712\
		0190914564856692346"
LEADING_CHARS = 2
max_length = len(pi) - LEADING_CHARS
digits = input('How many decimal places of Pi would you like me to print? ')

while digits > (max_length):
	print "Sorry! Please enter a number smaller than {0}".format(max_length)

print "Here you go: {0}".format(pi[0:(digits + 2)])