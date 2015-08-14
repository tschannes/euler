require './Timer.rb'

class Differ

	include Timer

	def initialize(limit)
		@range = 1.upto(limit).sort{|x, y| y <=> x }
		super
	end

	def square(x)
		return x * x
	end

	def sumOfSquares(ary)
		range = Array.new
		ary.each do |el|
			el = square(el)
			range.push(el)
		end
		return range.inject(:+)
	end

	def squareOfSum(ary)
		#puts ary.inject(:+)
		return square(ary.inject(:+))
	end

	def diff(x, y)
		d = Math.sqrt(square(x-y))
		return d
	end
	
	def run
		#puts sumOfSquares(@range)
		#puts squareOfSum(@range)
		x = sumOfSquares(@range)
		y = squareOfSum(@range)
		puts diff(x, y)
		measure
	end
end

y = Differ.new(100)
y.run