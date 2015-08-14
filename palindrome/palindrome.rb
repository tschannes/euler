require '../Timer'
#require 'pry'

class PaliHelpers

	include Timer

	def initialize(digitsPerFactor)
		@digits = digitsPerFactor
		@palins = Array.new
		super
	end

	def largestPossibleFactor(digits)
		maxFactor = ""
		digits.times do
			maxFactor << 9.to_s
		end
		max = maxFactor.to_i
		return max
	end

	def smallestPossibleFactor(digits)
		x = digits - 1
		return largestPossibleFactor(x) + 1
	end

	def isPalindrome(input)
		input = input.to_s
		true if input == input.reverse
	end

	def factorIsInRange(palin, factor)
		true if factor > smallestPossibleFactor(@digits) && palin/factor < largestPossibleFactor(@digits)
	end

	def isDivisibleBy(num, factor)
		true if num % factor == 0
	end

	def findMax
		max = largestPossibleFactor(@digits) * largestPossibleFactor(@digits)
		return max
	end

end

class PaliFinder < PaliHelpers

	def findAllPalindromes(max)
		while max > smallestPossibleFactor(@digits) * smallestPossibleFactor(@digits)
			if isPalindrome(max)
				@palins.push(max)
			end
			max -= 1
		end
		return @palins
	end

	def findLargestPalindrome(ary)
		ary.each do |num|
			factor = largestPossibleFactor(@digits)
			while factor > smallestPossibleFactor(@digits)
				if factorIsInRange(num,factor) && factorIsInRange(num, num/factor)
					if isDivisibleBy(num,factor) && isPalindrome(num)
						puts "The greatest possible palindrome is " + num.to_s + ", its factors being " + (num/factor).to_s + " and " + factor.to_s + "."
						return num
					end
				end	
				factor -= 1
			end
		end
	end

	def run
		max = findMax
		palins = findAllPalindromes(max)
		findLargestPalindrome(palins)
		measure
	end


end

y = PaliFinder.new(3)
y.run