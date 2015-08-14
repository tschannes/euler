require './Timer.rb'

class MultipleFinder

	include Timer

	def initialize(limit)
		@range = 1.upto(limit).sort{|x, y| y <=> x }
		@max = @range.inject(:*)
		super
	end

	def isDivisibleBy(num, factor)
		true if num % factor == 0
	end

	def isDivisibleByAll(num,ary)
		i = 0
		while i < ary.length
			el = ary[i]
			if isDivisibleBy(num, el)
				i += 1
			else
				#puts "Number cannot be divided by all Numbers contained in Ary."
				return false
			end
		end
		#puts "Number can be divided by all Numbers contained in Ary."
		return true
	end

	def reduce
		current = @max
		i = 0
		while i < @range.length
			if isDivisibleByAll(current/@range[i],@range)
				current = current / @range[i]
				i += 1
			else
				i += 1
			end
		end
		puts "Smallest Multiple is: " + current.to_s + "."
		return current
	end

	def run
		reduce
		measure
	end

end

y = MultipleFinder.new(20)
y.run