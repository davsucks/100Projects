# Fibonacci Sequence
# ==================
# Enter a number and have the program generate the
# Fibonacci sequence to that number or to the Nth number.

def fib(n):
	a, b, count = 0, 1, 0
	while count < n:
		print b,
		a, b = b, a+b
		count+=1

num = input('Give me the nth digit of the fibonacci sequence! ')

while num <= 0:
	num = input('Come on son... ')

fib(num)