def isPrime(x)
	return false if x < 2
	return true if x == 2
	return false if x % 2 == 0
	factorsCounter = 0
	n = 1
	bound = x / 2
	while n < bound
		factorsCounter += 1 if x % n == 0
		return false if factorsCounter > 2
		n += 1
	end
	true if factorsCounter < 2
end

puts isPrime(1)
puts isPrime(2)
puts isPrime(9)