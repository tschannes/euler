require './Timer.rb'

class PrimeFinder

	include Timer

	def initialize(nthElement)
		@limit = nthElement
		@primes = [2]
		super
	end

	def isPrime(x)
		factorsCounter = 0
		n = 1
		while n < x/2 && factorsCounter < 2
			factorsCounter += 1 if x % n == 0
			n += 1
		end
		true if factorsCounter < 2
	end

	def findNthPrime
		num = 1
		while @primes.length < @limit + 1
			@primes.push(num) if isPrime(num)
			num += 2
		end
		puts __method__.to_s + ": " + @primes[-1].to_s + " is the " + @limit.to_s + "th Prime."
		return @primes[-1]
	end

	def run
		findNthPrime
		measure
	end

end

x = PrimeFinder.new(2000)
x.run