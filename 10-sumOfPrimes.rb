=begin
Solution by http://itquestionz.com/questions/4006400/why-is-my-ruby-code-for-project-euler-10-so-slow
Still figuring out the range and step methods
Approach is called a Sieve of Eratosthenes: https://www.wikiwand.com/en/Sieve_of_Eratosthenes
=end

require './Timer.rb'
require 'pry'

class PrimeSumFinder

	include Timer

	def initialize(*args)
		@limit = args[0]
		super
	end

	def make_sieve

		num = @limit

		sieve = Array.new(num, true)

		sieve.each_with_index do |is_prime, i|
			next if i == 0 or not is_prime
			range = (i+i+1 .. num)
			range.step(i+1) { |i| sieve[i] = false }
		end

		puts sieve.each_index.select { |i| sieve[i] }.map { |i| i+1 }.inject(:+) - 1

	end

	def run
		make_sieve
		measure
	end

end

x = PrimeSumFinder.new(2000000)
x.run