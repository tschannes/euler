

require '../Timer'

class LargestPrimeFactor

	include Timer

	def initialize(number)
		@number = number
		super
	end

	def findFactors(number)
		factors = []
		current = 1
		half = number/2
		factor = number
		while current < factor
			if number % current == 0
				factor = number/current
				factors.push(current,factor)
				current += 1
			else
				current += 1
			end
		end
		factors = factors.sort{ |x,y| y <=> x }
		return factors
	end

	def maximusPrime(number)
		factors = findFactors(number)
		factors.each do |fac|
			if findFactors(fac).length == 2
				puts "Maximus Prime is: " + fac.to_s + "."
				return fac
			end
		end
		
	end

	def run
		maximusPrime(@number)
		measure
	end

end

x = LargestPrimeFactor.new(600851475143)
x.run
