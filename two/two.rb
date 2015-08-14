# Project Euler credentials: tschannes, 11l1r11l1r

require '../Timer'

class Fib

	include Timer

	def initialize(limit)
		@limit = limit
		@ary = [1,2]
		super
	end

	def fib
		counter = 0
		while counter < @limit
			last = @ary[-1] + @ary[-2]
			if last < @limit
				@ary.push(last)
			end
			counter = last
		end
		return @ary
	end

	def even
		evenArray = Array.new
		@ary.each do |i|
			if i % 2 == 0
				evenArray.push(i)
			end
		end
		return evenArray
	end

	def sum
		sum = even.inject(:+)
	end

	def run
		fib
		puts sum
		measure
	end
end

x = Fib.new(4000000)
x.run
