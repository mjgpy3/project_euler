func nievePrimeSlice(n int) []int {
	knownPrimes := []int{}
	number := 2
	var aux func(n int)
	aux = func(n int) {
		if n != 0 {
			primeFound := true
			for _, prime := range knownPrimes {
				if number % prime == 0 {
					primeFound = false
					break
				}
			}

			if primeFound {
				knownPrimes = append(knownPrimes, number)
				n -= 1
			}
			number += 1
			aux(n)
		}
	}

	aux(n)

	return knownPrimes
}
