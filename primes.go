import "math"

func nievePrimeSlice(n int) []int {
	knownPrimes := []int{}
	number := 2
	var aux func(n int)
	aux = func(n int) {
		if n != 0 {
			primeFound := true
			for _, prime := range knownPrimes {
				if float64(prime) > math.Sqrt(float64(number)) {
					break
				}
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

func primesWhile(continueCondition func(int)bool, op func(int)) []int {
	knownPrimes := []int{}
	number := 2
	var aux func()
	aux = func() {
		sqrtNum := math.Sqrt(float64(number))
		primeFound := true
		for _, prime := range knownPrimes {
			if float64(prime) > sqrtNum {
				break
			}
			if number % prime == 0 {
				primeFound = false
				break
			}
		}
		if primeFound {
			if !continueCondition(number) { return }
			op(number)
			knownPrimes = append(knownPrimes, number)
		}
		number += 1
		aux()
	}

	aux()

	return knownPrimes
}
