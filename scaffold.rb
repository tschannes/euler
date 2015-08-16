require './Timer.rb'

class Class

	include Timer

	def initialize(*args)

		super
	end

	def run
		
		measure
	end

end

x = Class.new()
x.run