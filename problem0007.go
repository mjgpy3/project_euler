package main

import (
	"fmt"
	"math"
)

func nievePrimeSlice(n int) []int {
	knownPrimes := []int{}
	number := 2
	var aux func(n int)
	aux = func(n int) {
		if n != 0 {
			primeFound := true
			sqrtNum := math.Sqrt(float64(number))
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

func main() {
	primes := nievePrimeSlice(10001)
	fmt.Println(primes[len(primes)-1])
}
