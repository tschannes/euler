module	Timer

	def initialize(x)
		@time = Time.now
		@class = self.class.name 
	end

	def measure
		puts @class + " took " + (Time.now - @time).to_s + " to run."
		return Time.now - @time
	end
end