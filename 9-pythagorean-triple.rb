require './Timer.rb'
require 'pry'

class TripletFinder

	include Timer

	def initialize(sum)
		@sum = sum
		@triplets = []
		super
	end

	def square(x)
		return x * x
	end

	def bruteFind
		a = 1
		b = 1
		c = 1
		s = @sum
		found = false
		while a < s do
			while b < s do
				c = s - a - b
				if square(a) + square(b) == square(c)
					found = true
					puts "A = #{a}, B = #{b}, C = #{c}, S being #{s}"
					return a * b * c
				end
				b += 1
			end
			b = 1
			a += 1
		end
		puts "#{a} + #{b} + #{c} = #{a + b + c}"
		return a*b*c
	end

	def run
		puts bruteFind
		measure
	end

end

x = TripletFinder.new(1000)
x.run

=begin
	def root(x)
		Math.sqrt(x)
	end

	def findTriplets
		m = 1
		n = 2
		sum = 1
		while sum <= 1000
			a = square(n) - square(m)
			b = 2 * n * m
			c = square(n) + square(m)
			m += 1
			n += 1
			sum = a + b + c
			break if sum == 1000
			puts "#{a} + #{b} + #{c} = #{sum}"
		end
		return a*b*c
	end
=end
