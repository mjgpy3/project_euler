package main

import (
	"fmt"
	"math"
)

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

func main() {
	var count int
	primesWhile(func (p int) bool {
		return p < 2000000
	}, func (p int) {
		count += p
	})

	fmt.Println(count)
}
