require './Timer.rb'
#require 'pry'

class PrimeFinder

	include Timer

	def initialize(nthElement)
		@limit = nthElement
		@primes = [2]
		super
	end



	def isPrime(x)
		return false if x % 2 == 0
		factors = []
		counter = factors.length
		n = 1
		while n < x
			if x % n == 0
				factors.push(n)
				counter += 1
				n += 1
			end
			n += 1
		end
		if counter < 2
			return true
		else
			return false
		end
	end

	def findNthPrime
		n = 2
		while @primes.length < @limit
			if isPrime(n)
				@primes.push(n)
				n += 1
			else
				n += 1
			end
		end
		puts @primes[-1].to_s + " is the " + @limit.to_s + "th Prime."
		return @primes[-1]
	end

	def run
		findNthPrime
		measure
	end

end

x = PrimeFinder.new(2000)
x.run