require '../Timer'
require 'pry'

class LargestPalindromeFinder

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

	def findLargestPalindrome
		maxFactor = largestPossibleFactor(@digits)
		optFactor = maxFactor
		maxNum = maxFactor * optFactor
		while maxNum > 0
			maxNum = maxFactor * optFactor
			if isPalindrome(maxNum)
				puts "The greatest possible palindrome is: " + maxNum.to_s + "."
				return maxNum
			else
				optFactor -= 1
			end
		end
	end

	def run
		findLargestPalindrome
		measure
	end

end

class PaliFinder < LargestPalindromeFinder

	def findMax
		max = largestPossibleFactor(@digits) * largestPossibleFactor(@digits)
		return max
	end

	def findPalindromes(num)
		factor = largestPossibleFactor
		while num > smallestPossibleFactor(@digits) * smallestPossibleFactor(@digits)

			if isPalindrome(num)

				@palins.push(num)
				num -= 1
			else
				num -= 1
			end
		end
		return @palins
	end

	def factorIsInRange(palin, factor)
		true if factor > smallestPossibleFactor(@digits) && palin/factor > smallestPossibleFactor

	def isDivisibleBy(factor)
		
	end


	def run
		palindromes = findPalindromes(findMax)
		puts palindromes.to_s
		#checkFactors(palindromes)
		measure
	end


end

x = LargestPalindromeFinder.new(3)
x.run

y = PaliFinder.new(3)
y.run
