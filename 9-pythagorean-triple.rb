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