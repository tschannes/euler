require './Timer.rb'
#require 'pry'

class PrimeFinder

	include Timer

	def initialize(nthElement)
		@limit = nthElement
		super
	end

	def nthElement
		primes = []
		num = 1

		while primes.length < @limit
			num += 1
			x = 1
			counter = 0
			next if num % 2 == 0
			while x < num
				counter += 1 if num % x == 0
				#binding.pry
				x += 1
				isPrime = false if counter > 2
			end
			primes.push(num) if isPrime 
			puts "The " + primes.length.to_s + "th Prime is: " + primes[-1].to_s + "."
		end
		puts primes[-1]
		return primes[-1]
	end

	def isPrime(x)
		return false if x % 2 == 0
		#factors = []
		counter = 0
		n = 1
		while n < x
			if x % n == 0
				#factors.push(n)
				counter += 1
				n += 1
			end
			return false if counter > 2
			n += 1
		end
		return true
	end

	def findNthPrime
		i = 1
		counter = 0
		primes = [] 
		while counter <= @limit
			if isPrime(i)
				primes.push(i)
				counter += 1
				puts "The " + primes.length.to_s + "th Prime is: " + primes[-1].to_s + "."
			end
			i += 2
		end
		puts primes[-1]
		return primes[-1]
	end

	def run
		#nthElement
		findNthPrime
		measure
	end

end

x = PrimeFinder.new(6)
x.run