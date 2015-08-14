# Project Euler credentials: tschannes, 11l1r11l1r

require '../Timer'

class One

	include Timer

	def initialize(limit)
		@limit = limit
		@range = []
		@selection = []
		super
	end
	
	def numRange
		1.upto(@limit - 1){|i| @range.push(i)}
		#puts @range
		return @range
	end

	def pickNums
		@range.each do |i|
			if i % 3 == 0 or i % 5 == 0
				@selection.push(i)
			end
		end
		#puts @selection
		return @selection
	end

	def sum(selection)
		sum = 0
		selection.each do |i|
			sum = sum + i
		end
		puts "The sum of all numbers divisible between 3 or 5 is " + sum.to_s + "."
		return sum
	end

	def run
		numRange
		pickNums
		sum(@selection)
		measure
	end
end

class OneTwo

	include Timer

	def initialize(limit)
		@limit = limit
		@result = 0
		super
	end

	def sums(divisor)
		# boundary = @limit/divisor-1
		# ary = []
		# range = 1.upto(boundary){|i| ary.push(i)}
		# @result = ary.each do |i|
		# 	@result = @result + i * divisor
		# end
		# puts @result.to_s
		# return @result
	end

	def run
		#puts (sums(3) + sums(5) - sums(15)).to_s
		measure
	end

end

x = One.new(1000)
x.run

y = OneTwo.new(1000)
y.run